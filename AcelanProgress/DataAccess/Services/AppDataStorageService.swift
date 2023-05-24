//
//  AppDataStorageService.swift
//  AcelanProgress
//
//  Created by Mikhail Yeremeyev on 01.05.2023.
//

import Foundation
import StatefulArch

final class AppDataStorageService {
    
    private let userEmailKey = "AppDataStorageService_userEmail"
    
    private let tokenStorage: JSONWebTokenStorage
    
    init(serviceProvider: ServiceProvider) {
        self.tokenStorage = serviceProvider.provideService()
    }
    
    var userEmail: String? {
        get { UserDefaults.standard.string(forKey: userEmailKey) }
        set { UserDefaults.standard.set(newValue, forKey: userEmailKey) }
    }
    
    var isAuthorized: Bool {
        tokenStorage.getToken(byType: .access) != nil
    }
    
    func clearAppData() {
        userEmail = nil
        tokenStorage.clearToken()
    }
    
}
