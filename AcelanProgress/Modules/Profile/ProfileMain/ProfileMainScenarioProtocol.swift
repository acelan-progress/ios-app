//
//  ProfileMainScenarioProtocol.swift
//  AcelanProgress
//
//  Created by Mikhail Yeremeyev on 23.04.2023.
//

import Foundation
import StatefulArch

@MainActor
protocol ProfileMainScenarioProtocol: PageScenario {
    
    func performLogout() async
    
    func setEmail()
    
    func bindFrom(loadingPublisher: inout Published<Bool>.Publisher)
    func bindFrom(emailPublisher: inout Published<String>.Publisher)
    
}
