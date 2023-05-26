//
//  ModelViewerMainInterceptor.swift
//  AcelanProgress
//
//  Created by Mikhail Yeremeyev on 01.05.2023.
//

import Foundation
import StatefulArch

final class ModelViewerMainInterceptor: PageInterceptor<ModelViewerMainAction, ModelViewerMainState> {
    
    private var scenario: ModelViewerScenarioProtocol!
    
    override func provideServices(withServiceProvider serviceProvider: ServiceProvider) {
        serviceProvider.provide(service: &scenario)
    }
    
    override func handle(action: ModelViewerMainAction) async {
        switch action {
        case .goBack:
            NavigationService.pop()
            
        case .deleteModel:
            await scenario.deleteModel()
            NavigationService.pop()
        }
    }
    
    override func subscribe(withState state: inout ModelViewerMainState) {
        scenario.setTo(artifactId: state.artifactId)

        scenario.bindFrom(modelFilenamePublisher: &state.$modelFilename)
        scenario.bindFrom(loadingPublisher: &state.$loading)
    }
    
    override func handle(lifeCycleEvent: PageLifeCycleEvent) async {
        switch lifeCycleEvent {
        case .willAppear:
            await scenario.loadModel()
            
        default:
            break
        }
    }
    
}
