//
//  TokenStorage.swift
//  AcelanProgress
//
//  Created by Mikhail Yeremeyev on 01.05.2023.
//

import Foundation
import WebClient

final class TokenStorage: AuthorizationTokenStorage {

    private static let tokenKey = "TokenStorage_token"
    
    func update(accessToken: String, refreshToken: String?) {
        UserDefaults.standard.set(accessToken, forKey: Self.tokenKey)
    }
    
    func getToken(byType tokenType: TokenType) -> String? {
        UserDefaults.standard.string(forKey: Self.tokenKey)
    }
    
    func clearToken() {
        UserDefaults.standard.set(nil, forKey: Self.tokenKey)
    }
    
}
