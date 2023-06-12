//
//  AuthService.swift
//  AcelanProgress
//
//  Created by Mikhail Yeremeyev on 01.05.2023.
//

import Foundation
import StatefulArch

final class AuthService {
    
    private let apiClient: ApiClient
    private let tokenStorage: JSONWebTokenStorage
    private let appDataStorageService: AppDataStorageService
    private let artifactsRepository: ArtifactsRepository
    
    init(serviceProvider: ServiceProvider) {
        self.apiClient = serviceProvider.provideService()
        self.tokenStorage = serviceProvider.provideService()
        self.appDataStorageService = serviceProvider.provideService()
        self.artifactsRepository = serviceProvider.provideService()
    }
    
    func performLogIn(email: String, password: String) async throws {
        let token: TokenResponse = try await apiClient.request(with: .getTokenParameters(email: email, password: password))
        
        tokenStorage.update(accessToken: token.token, refreshToken: nil)
        appDataStorageService.userEmail = email
    }
    
    func performLogOut() async throws {
        try await artifactsRepository.deleteAllArtifacts()
        
        tokenStorage.clearToken()
        appDataStorageService.clearAppData()
    }
    
}
