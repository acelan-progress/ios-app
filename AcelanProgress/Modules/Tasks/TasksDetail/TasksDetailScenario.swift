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
    
    override func provideServices(with serviceProvider: ServiceProvider) {
        serviceProvider.provide(service: &tasksService)
    }
    
    var taskId: Int!
    
    @Published
    var acelanTask: AcelanTask? = nil
    
    @Published
    var loading: Bool = false
    
}

extension TasksDetailScenario: TasksDetailScenarioProtocol, ErrorHandler {
    
    func setTo(taskId: Int) {
        self.taskId = taskId
    }
    
    func bindFrom(acelanTaskPublisher: inout Published<AcelanTask?>.Publisher) {
        $acelanTask.assign(to: &acelanTaskPublisher)
    }
    
    func bindFrom(loadingPublisher: inout Published<Bool>.Publisher) {
        $loading.assign(to: &loadingPublisher)
    }
    
    func loadTask() async {
        loading = true
        
        let result = await handleErrorIn {
            try await tasksService.getTask(taskId: taskId)
        }
        
        if let acelanTask = result.value {
            self.acelanTask = acelanTask
        }
        
        loading = false
    }
    
}
