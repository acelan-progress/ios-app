//
//  TasksDetailInterceptor.swift
//  AcelanProgress
//
//  Created by Mikhail Yeremeyev on 25.04.2023.
//

import Foundation
import StatefulArch

final class TasksDetailInterceptor: PageInterceptor<TasksDetailAction, TasksDetailState> {
    
    private var scenario: TasksDetailScenarioProtocol!
    
    override func provideServices(withServiceProvider serviceProvider: ServiceProvider) {
        serviceProvider.provide(service: &scenario)
    }
    
    override func handle(action: TasksDetailAction) async {
        switch action {
        case .goBack:
            NavigationService.pop()
        }
    }
    
    override func subscribe(withState state: inout TasksDetailState) {
        scenario.bindFrom(loadingPublisher: &state.$loading)
        scenario.bindFrom(acelanTaskPublisher: &state.$acelanTask)
        scenario.setTaskId(taskId: state.taskId)
    }
    
    override func handle(lifeCycleEvent: PageLifeCycleEvent) async {
        switch lifeCycleEvent {
        case .willAppear:
            await scenario.loadTask()
            
        default:
            break
        }
    }
    
}
