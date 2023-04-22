//
//  LoginMainScenarioProtocol.swift
//  AcelanProgress
//
//  Created by Mikhail Yeremeyev on 22.04.2023.
//

import Foundation
import StatefulArch

@MainActor
protocol LoginMainScenarioProtocol: PageScenario {
    
    func login(email: String, password: String) async
    
    func bindFrom(loadingPublisher: inout Published<Bool>.Publisher)
    
}
