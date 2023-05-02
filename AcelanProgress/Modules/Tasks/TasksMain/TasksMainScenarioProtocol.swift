//
//  TasksMainScenarioProtocol.swift
//  AcelanProgress
//
//  Created by Mikhail Yeremeyev on 01.05.2023.
//

import Foundation

@MainActor
protocol TasksMainScenarioProtocol {
    
    func refreshTasks() async
    
    func bindFrom(tasksPublisher: inout Published<[AcelanTask]>.Publisher)
    func bindFrom(loadingPublisher: inout Published<Bool>.Publisher)
    
}
