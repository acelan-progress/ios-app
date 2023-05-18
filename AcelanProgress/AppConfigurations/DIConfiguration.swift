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
import WebClient

enum DIConfiguration: AppConfigurationModule {
    
    static let container = DIContainer()
    
    static func setup() {
        setupScenarios(in: container)
        setupServices(in: container)
    }
    
}

extension DIConfiguration {
    
    static func setupScenarios(in container: DIContainer) {
        container.registerDependency(LoginMainScenarioProtocol.self) {
            LoginMainScenario(serviceProvider: container)
        }
        
        container.registerDependency(ProfileMainScenarioProtocol.self) {
            ProfileMainScenario(serviceProvider: container)
        }
        
        container.registerDependency(TasksMainScenarioProtocol.self) {
            TasksMainScenario(serviceProvider: container)
        }
        
        container.registerDependency(TasksDetailScenarioProtocol.self) {
            TasksDetailScenario(serviceProvider: container)
        }
    }
    
    static func setupServices(in container: DIContainer) {
        container.registerDependency(TokenStorage.self) {
            TokenStorage()
        }
        
        container.registerDependency(WebClient.self, scope: .instance) {
            let urlSessionConfiguration = URLSessionConfiguration.default
            urlSessionConfiguration.requestCachePolicy = .reloadIgnoringLocalAndRemoteCacheData
            let session = URLSession(configuration: urlSessionConfiguration)
            let tokenStorage: TokenStorage = container.provideService()
            let client = WebClient(
                session: session,
                authorizationMethods: [ApiAuthorizationMethod()],
                authorizationTokenStorage: tokenStorage
            )
            return client
        }
        
        container.registerDependency(DownloadManager.self, scope: .instance) {
            let session = URLSession(configuration: .default)
            let downloadManager = DownloadManager(session: session)
            return downloadManager
        }
        
        container.registerDependency(ArtifactsService.self) {
            ArtifactsService(serviceProvider: container)
        }
        
        container.registerDependency(ApiClient.self) {
            ApiClient(serviceProvider: container)
        }
        
        container.registerDependency(AppDataStorageService.self, scope: .instance) {
            AppDataStorageService(serviceProvider: container)
        }
        
        container.registerDependency(AuthService.self) {
            AuthService(serviceProvider: container)
        }
        
        container.registerDependency(TasksService.self) {
            TasksService(serviceProvider: container)
        }
    }
    
}

extension DIContainer: ServiceProvider {
    
    public func provideService<T>() -> T {
        loadDependency()
    }
    
}
