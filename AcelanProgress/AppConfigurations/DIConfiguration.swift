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
        setupRepositories(in: container)
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
    
        container.registerDependency(ModelViewerMainScenarioProtocol.self) {
            ModelViewerMainScenario(serviceProvider: container)
        }
        
        container.registerDependency(ArtifactsMainScenarioProtocol.self) {
            ArtifactsMainScenario(serviceProvider: container)
        }
    }
    
    static func setupServices(in container: DIContainer) {
        container.registerDependency(JSONWebTokenStorage.self) {
            JSONWebTokenStorage()
        }
        
        container.registerDependency(WebClient.self, scope: .instance) {
            let urlSessionConfiguration = URLSessionConfiguration.default
            urlSessionConfiguration.requestCachePolicy = .reloadIgnoringLocalAndRemoteCacheData
            let session = URLSession(configuration: urlSessionConfiguration)
            let tokenStorage: JSONWebTokenStorage = container.provideService()
            let client = WebClient(
                session: session,
                authorizationMethods: [BearerAuthorizationMethod()],
                authorizationTokenStorage: tokenStorage
            )
            return client
        }
        
        container.registerDependency(ArtifactsService.self) {
            let session = URLSession(configuration: .default)
            return ArtifactsService(session: session)
        }
        
        container.registerDependency(ApiClient.self, scope: .instance) {
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
    
    static func setupRepositories(in container: DIContainer) {
        container.registerDependency(ArtifactsRepository.self, scope: .instance) {
            ArtifactsRepository()
        }
    }
    
}

extension DIContainer: ServiceProvider {
    
    public func provideService<T>() -> T {
        loadDependency()
    }
    
}
