//
//  ModelViewerMainScenario.swift
//  AcelanProgress
//
//  Created by Mikhail Yeremeyev on 21.05.2023.
//

import Foundation
import StatefulArch

final class ModelViewerMainScenario: PageScenario {
    
    private var artifactsRepository: ArtifactsRepository!
    
    override func provideServices(with serviceProvider: ServiceProvider) {
        serviceProvider.provide(service: &artifactsRepository)
    }
    
    var artifactId: Int!
    
    @Published
    var modelFilename: String?
    
    @Published
    var loading = false
    
}

extension ModelViewerMainScenario: ModelViewerMainScenarioProtocol, ErrorHandler {
    
    func loadModel() async {
        defer {
            loading = false
        }
        loading = true
        
        let result = await handleError {
            try await artifactsRepository.getArtifact(id: artifactId)
        }
        
        guard let value = result.value else {
            return
        }
        
        modelFilename = value?.filename
    }
    
    func deleteModel() async {
        defer {
            loading = false
        }
        loading = true
        
        await handleError {
            try await artifactsRepository.deleteArtifact(id: artifactId)
        }
    }
    
    func setTo(artifactId: Int) {
        self.artifactId = artifactId
    }
    
    func bindFrom(modelFilenamePublisher: inout Published<String?>.Publisher) {
        $modelFilename.assign(to: &modelFilenamePublisher)
    }
    
    func bindFrom(loadingPublisher: inout Published<Bool>.Publisher) {
        $loading.assign(to: &loadingPublisher)
    }
    
}
