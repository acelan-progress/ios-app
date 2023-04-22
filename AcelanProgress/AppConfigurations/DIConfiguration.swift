//
//  DIConfiguration.swift
//  AcelanProgress
//
//  Created by Mikhail Yeremeyev on 22.04.2023.
//

import Foundation
import SwiftDI
import StatefulArch
import AppConfiguration

enum DIConfiguration: AppConfigurationModule {
    
    static let container = DIContainer()
    
    static func setup() {
        
        setupScenarios(in: container)
        
    }
    
}

extension DIConfiguration {
    
    static func setupScenarios(in container: DIContainer) {
     
        container.registerDependency(LoginMainScenarioProtocol.self) {
            LoginMainScenario(serviceProvider: container)
        }
        
    }
    
}

extension DIContainer: ServiceProvider {
    
    public func provideService<T>() -> T {
        loadDependency()
    }
    
}
