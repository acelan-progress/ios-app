//
//  AppDataStorageService.swift
//  AcelanProgress
//
//  Created by Mikhail Yeremeyev on 01.05.2023.
//

import Foundation
import StatefulArch

final class AppDataStorageService {
    
    private static let userEmailKey = "AppDataStorageService_userEmail"
    
    private let tokenStorage: TokenStorage
    
    init(serviceProvider: ServiceProvider) {
        self.tokenStorage = serviceProvider.provideService()
    }
    
    var userEmail: String? {
        get { UserDefaults.standard.string(forKey: Self.userEmailKey) }
        set { UserDefaults.standard.set(newValue, forKey: Self.userEmailKey) }
    }
    
    var isAuthorized: Bool {
        tokenStorage.getToken(byType: .access) != nil
    }
    
    func clearAppData() {
        userEmail = nil
        tokenStorage.clearToken()
    }
    
}
