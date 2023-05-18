//
//  TasksDetailScenarioProtocol.swift
//  AcelanProgress
//
//  Created by Mikhail Yeremeyev on 02.05.2023.
//

import Foundation
import StatefulArch

@MainActor
protocol TasksDetailScenarioProtocol: PageScenario {
    
    func setTo(taskId: Int)
    
    func bindFrom(acelanTaskPublisher: inout Published<AcelanTask?>.Publisher)
    func bindFrom(loadingPublisher: inout Published<Bool>.Publisher)
    func bindFrom(downloadingArtifactPublisher: inout Published<Bool>.Publisher)
    func bindFrom(artifactDownloadProgressPublisher: inout Published<Double>.Publisher)
    
    func loadTask() async
    
    func downloadArtifact() async
    
}
