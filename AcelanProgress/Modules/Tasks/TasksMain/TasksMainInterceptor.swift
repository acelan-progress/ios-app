//
//  TasksMainInterceptor.swift
//  AcelanProgress
//
//  Created by Mikhail Yeremeyev on 23.04.2023.
//

import Foundation
import StatefulArch

final class TasksMainInterceptor: PageInterceptor<TasksMainAction, TasksMainState> {
    
    private var scenario: TasksMainScenarioProtocol!
    
    override func provideServices(withServiceProvider serviceProvider: ServiceProvider) {
        serviceProvider.provide(service: &scenario)
    }
    
    override func handle(action: TasksMainAction) async {
        switch action {
        case let .openTaskItemDetail(taskItem):
            switch taskItem {
            case let .task(acelanTask):
                NavigationService.push(using: TasksModuleBuilder.detail(taskId: acelanTask.id))
            }
        }
    }
    
    override func subscribe(withState state: inout TasksMainState) {
        scenario.bindFrom(loadingPublisher: &state.$loading)
        scenario.bindFrom(tasksPublisher: &state.$tasks)
    }
    
    override func handle(lifeCycleEvent: PageLifeCycleEvent) async {
        switch lifeCycleEvent {
        case .willAppear:
            await scenario.refreshTasks()
        
        default:
            break
        }
    }
    
}
