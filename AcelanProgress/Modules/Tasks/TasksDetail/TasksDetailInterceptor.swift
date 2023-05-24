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
            
        case .downloadArtifact:
            await scenario.downloadArtifact()
            
        case let .openModelViewer(artifactId):
            NavigationService.push(using: ModelViewerModuleBuilder.main(artifactId: artifactId))
        }
    }
    
    override func subscribe(withState state: inout TasksDetailState) {
        scenario.setTo(taskId: state.taskId)
        
        scenario.bindFrom(acelanTaskPublisher: &state.$acelanTask)
        scenario.bindFrom(loadingPublisher: &state.$loading)
        scenario.bindFrom(artifactIdPublisher: &state.$artifactId)
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
