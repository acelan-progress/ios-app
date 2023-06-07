//
//  ModelViewerMainScenarioProtocol.swift
//  AcelanProgress
//
//  Created by Mikhail Yeremeyev on 21.05.2023.
//

import Foundation
import StatefulArch

@MainActor
protocol ModelViewerMainScenarioProtocol: PageScenario {
    
    func loadModel() async
    func deleteModel() async
    
    func setTo(artifactId: Int)
    
    func bindFrom(modelFilenamePublisher: inout Published<String?>.Publisher)
    func bindFrom(loadingPublisher: inout Published<Bool>.Publisher)
    
}
