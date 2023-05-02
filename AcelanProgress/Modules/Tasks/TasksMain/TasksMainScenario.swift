//
//  TasksMainScenario.swift
//  AcelanProgress
//
//  Created by Mikhail Yeremeyev on 01.05.2023.
//

import Foundation
import StatefulArch

final class TasksMainScenario: PageScenario {
    
    private var tasksService: TasksService!
    
    @Published
    var tasks: [AcelanTask] = []
    
    @Published
    var loading: Bool = false
    
    override func provideServices(with serviceProvider: ServiceProvider) {
        serviceProvider.provide(service: &tasksService)
    }
    
}

extension TasksMainScenario: TasksMainScenarioProtocol, ErrorHandler {
    
    func refreshTasks() async {
        loading = true
        
        let result = await handleErrorIn(action: {
            try await tasksService.getTasks()
        })
        
        if let tasks = result.value {
            self.tasks = tasks
        }
        
        loading = false
    }
    
    func bindFrom(tasksPublisher: inout Published<[AcelanTask]>.Publisher) {
        $tasks.assign(to: &tasksPublisher)
    }
    
    func bindFrom(loadingPublisher: inout Published<Bool>.Publisher) {
        $loading.assign(to: &loadingPublisher)
    }
    
}
