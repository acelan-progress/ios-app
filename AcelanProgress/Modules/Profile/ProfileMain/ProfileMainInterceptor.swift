//
//  ProfileMainInterceptor.swift
//  AcelanProgress
//
//  Created by Mikhail Yeremeyev on 23.04.2023.
//

import Foundation
import StatefulArch

final class ProfileMainInterceptor: PageInterceptor<ProfileMainAction, ProfileMainState> {
    
    private var scenario: ProfileMainScenarioProtocol!
    
    override func provideServices(withServiceProvider serviceProvider: ServiceProvider) {
        serviceProvider.provide(service: &scenario)
    }
    
    override func handle(action: ProfileMainAction) async {
        switch action {
        case .performLogout:
            await scenario.performLogout()
            NavigationService.setRoot(using: LoginModuleBuilder.main)
        }
    }
    
    override func subscribe(withState state: inout ProfileMainState) {
        scenario.bindFrom(loadingPublisher: &state.$loading)
    }
    
}
