//
//  NavigationConfiguration.swift
//  AcelanProgress
//
//  Created by Mikhail Yeremeyev on 22.04.2023.
//

import Foundation
import StatefulArch
import AppConfiguration

enum NavigationConfiguration: AppConfigurationModule {
    
    static func setup() {
        NavigationService.set(serviceProvider: DIConfiguration.container)
        
        let appDataStorageService: AppDataStorageService = DIConfiguration.container.provideService()
        
        if appDataStorageService.isAuthorized {
            NavigationService.setRoot(using: MainModuleBuilder.tabBar)
        } else {
            NavigationService.setRoot(using: LoginModuleBuilder.main)
        }
    }
    
}
