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
            if let email = state?.email, let password = state?.password {
                await scenario.login(email: email, password: password)
            }
            
            NavigationService.setRoot(using: TasksModuleBuilder.main)
        }
    }
    
    override func subscribe(withState state: inout LoginMainState) {
        scenario.bindFrom(loadingPublisher: &state.$loading)
    }
    
}
