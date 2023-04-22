//
//  LoginMainScenario.swift
//  AcelanProgress
//
//  Created by Mikhail Yeremeyev on 22.04.2023.
//

import Foundation
import StatefulArch

final class LoginMainScenario: PageScenario {
    
    @Published
    var loading: Bool = false
    
    func login(email: String, password: String) async -> Void {
        loading = true
        // TODO: - Implement API request
    }
    
}

extension LoginMainScenario: LoginMainScenarioProtocol {
    
    func bindFrom(loadingPublisher: inout Published<Bool>.Publisher) {
        $loading.assign(to: &loadingPublisher)
    }
    
}
