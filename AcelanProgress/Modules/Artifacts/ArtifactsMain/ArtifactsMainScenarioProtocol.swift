//
//  ArtifactsMainScenarioProtocol.swift
//  AcelanProgress
//
//  Created by Mikhail Yeremeyev on 21.05.2023.
//

import Foundation
import StatefulArch

@MainActor
protocol ArtifactsMainScenarioProtocol: PageScenario {
    
    func loadArtifacts() async
    
    func bindFrom(acelanTaskArtifactsPublisher: inout Published<[AcelanTaskArtifact]>.Publisher)
    func bindFrom(loadingPublisher: inout Published<Bool>.Publisher)
    
}
