//
//  TasksDetailScenario.swift
//  AcelanProgress
//
//  Created by Mikhail Yeremeyev on 02.05.2023.
//

import Foundation
import StatefulArch

final class TasksDetailScenario: PageScenario {
    
    private var tasksService: TasksService!
    private var artifactsService: ArtifactsService!
    private var artifactsRepository: ArtifactsRepository!
    
    override func provideServices(with serviceProvider: ServiceProvider) {
        serviceProvider.provide(service: &tasksService)
        serviceProvider.provide(service: &artifactsService)
        serviceProvider.provide(service: &artifactsRepository)
    }
    
    var taskId: Int!
    
    @Published
    var acelanTask: AcelanTask?
    
    @Published
    var loading = false
    
    @Published
    var artifactId: Int?
    
}

extension TasksDetailScenario: TasksDetailScenarioProtocol, ErrorHandler {
    
    func loadTask() async {
        defer {
            loading = false
        }
        loading = true
        
        let result = await handleError {
            try await tasksService.getTask(taskId: taskId)
        }
        
        if let acelanTask = result.value {
            self.acelanTask = acelanTask
        }
        
        await checkArtifactDownloaded()
    }
    
    func downloadArtifact() async {
        defer {
            loading = false
        }
        loading = true
        
        guard let acelanTask else {
            return
        }
        
        guard let acelanTaskArtifact = acelanTask.supportedArtifact else {
            return
        }
        defer {
            artifactId = acelanTaskArtifact.id
        }
        
        guard let artifactSourceURL = acelanTaskArtifact.artifactSourceURL else {
            return
        }
        
        let filename = artifactSourceURL.lastPathComponent
        guard let artifactDestinationUrl = filename.modelFileURL else {
            return
        }

        await handleError {
            try await artifactsService.downloadArtifact(from: artifactSourceURL, to: artifactDestinationUrl)
        }
        
        await handleError {
            try await artifactsRepository.createArtifact(
                id: acelanTaskArtifact.id,
                fileType: acelanTaskArtifact.file_type,
                remoteURL: acelanTaskArtifact.url,
                filename: filename,
                taskId: taskId
            )
        }
    }
    
    func setTo(taskId: Int) {
        self.taskId = taskId
    }
    
    func bindFrom(acelanTaskPublisher: inout Published<AcelanTask?>.Publisher) {
        $acelanTask.assign(to: &acelanTaskPublisher)
    }
    
    func bindFrom(loadingPublisher: inout Published<Bool>.Publisher) {
        $loading.assign(to: &loadingPublisher)
    }
    
    func bindFrom(artifactIdPublisher: inout Published<Int?>.Publisher) {
        $artifactId.assign(to: &artifactIdPublisher)
    }
    
    private func checkArtifactDownloaded() async {
        guard let acelanTask else {
            return
        }
        
        guard let acelanTaskArtifact = acelanTask.supportedArtifact else {
            return
        }
        
        let result = await handleError {
            try await artifactsRepository.getArtifact(id: acelanTaskArtifact.id)
        }
        
        guard let artifact = result.value else {
            return
        }
        
        artifactId = artifact?.id
    }
    
}
