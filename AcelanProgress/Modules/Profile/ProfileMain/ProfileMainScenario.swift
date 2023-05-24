//
//  ProfileMainScenario.swift
//  AcelanProgress
//
//  Created by Mikhail Yeremeyev on 23.04.2023.
//

import Foundation
import StatefulArch

final class ProfileMainScenario: PageScenario {
    
    private var authService: AuthService!
    private var appDataStorageService: AppDataStorageService!
    
    override func provideServices(with serviceProvider: ServiceProvider) {
        serviceProvider.provide(service: &authService)
        serviceProvider.provide(service: &appDataStorageService)
    }
    
    @Published
    var loading = false
    
    @Published
    var email: String = .dash
    
}

extension ProfileMainScenario: ProfileMainScenarioProtocol, ErrorHandler {
    
    func performLogout() async {
        defer {
            loading = false
        }
        loading = true
        
        
        await handleError {
            try await authService.performLogOut()
        }
    }
    
    func setEmail() {
        email = appDataStorageService.userEmail ?? .dash
    }
    
    func bindFrom(loadingPublisher: inout Published<Bool>.Publisher) {
        $loading.assign(to: &loadingPublisher)
    }
    
    func bindFrom(emailPublisher: inout Published<String>.Publisher) {
        $email.assign(to: &emailPublisher)
    }
    
}
