//
//  ModelViewerScenarioProtocol.swift
//  AcelanProgress
//
//  Created by Mikhail Yeremeyev on 21.05.2023.
//

import Foundation
import StatefulArch

@MainActor
protocol ModelViewerScenarioProtocol: PageScenario {
    
    func setTo(artifactId: Int)
    
    func bindFrom(modelFilenamePublisher: inout Published<String?>.Publisher)
    func bindFrom(loadingPublisher: inout Published<Bool>.Publisher)
    
    func loadModel() async
    func deleteModel() async
    
}
