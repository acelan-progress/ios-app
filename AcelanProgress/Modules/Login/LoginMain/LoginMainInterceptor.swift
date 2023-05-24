//
//  LoginMainInterceptor.swift
//  AcelanProgress
//
//  Created by Mikhail Yeremeyev on 22.04.2023.
//

import Foundation
import StatefulArch

final class LoginMainInterceptor: PageInterceptor<LoginMainAction, LoginMainState> {
    
    private var scenario: LoginMainScenarioProtocol!
    
    override func provideServices(withServiceProvider serviceProvider: ServiceProvider) {
        serviceProvider.provide(service: &scenario)
    }
    
    override func handle(action: LoginMainAction) async {
        switch action {
        case .performLogin:
            guard
                let email = state?.email,
                let password = state?.password,
                !email.isEmpty,
                !password.isEmpty else {
                return
            }
            
            let result = await scenario.performLogIn(email: email, password: password)
            
            if result {
                NavigationService.replace(using: MainModuleBuilder.tabBar)
            }
        }
    }
    
    override func subscribe(withState state: inout LoginMainState) {
        scenario.bindFrom(loadingPublisher: &state.$loading)
    }
    
}
