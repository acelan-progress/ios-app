//
//  ArtifactsMainInterceptor.swift
//  AcelanProgress
//
//  Created by Mikhail Yeremeyev on 01.05.2023.
//

import Foundation
import StatefulArch

final class ArtifactsMainInterceptor: PageInterceptor<ArtifactsMainAction, ArtifactsMainState> {
    
    private var scenario: ArtifactsMainScenarioProtocol!
    
    override func provideServices(withServiceProvider serviceProvider: ServiceProvider) {
        serviceProvider.provide(service: &scenario)
    }
    
    override func handle(action: ArtifactsMainAction) async {
        switch action {
        case let .openModelViewer(artifactItem):
            switch artifactItem {
            case let .acelanTaskArtifact(acelanTaskArtifact):
                NavigationService.push(using: ModelViewerModuleBuilder.main(artifactId: acelanTaskArtifact.id))
            }
        }
    }
    
    override func handle(lifeCycleEvent: PageLifeCycleEvent) async {
        switch lifeCycleEvent {
        case .willAppear:
            await scenario.loadArtifacts()
            
        default:
            break
        }
    }
    
    override func subscribe(withState state: inout ArtifactsMainState) {
        scenario.bindFrom(acelanTaskArtifactsPublisher: &state.$acelanTaskArtifacts)
        scenario.bindFrom(loadingPublisher: &state.$loading)
    }
    
}
