//
//  ArtifactsMainScenario.swift
//  AcelanProgress
//
//  Created by Mikhail Yeremeyev on 21.05.2023.
//

import Foundation
import StatefulArch

final class ArtifactsMainScenario: PageScenario {
    
    private var artifactsRepository: ArtifactsRepository!
    
    override func provideServices(with serviceProvider: ServiceProvider) {
        serviceProvider.provide(service: &artifactsRepository)
    }
    
    @Published
    var loading = false
    
    @Published
    var acelanTaskArtifacts = [AcelanTaskArtifact]()
    
}

extension ArtifactsMainScenario: ArtifactsMainScenarioProtocol, ErrorHandler {
    
    func loadArtifacts() async {
        defer {
            loading = false
        }
        loading = true
        
        let results = await handleError {
            try await artifactsRepository.getArtifacts()
        }
        
        acelanTaskArtifacts = results.value?.map(AcelanTaskArtifact.create(from:)) ?? []
    }
    
    func bindFrom(acelanTaskArtifactsPublisher: inout Published<[AcelanTaskArtifact]>.Publisher) {
        $acelanTaskArtifacts.assign(to: &acelanTaskArtifactsPublisher)
    }
    
    func bindFrom(loadingPublisher: inout Published<Bool>.Publisher) {
        $loading.assign(to: &loadingPublisher)
    }
    
}
