//
//  JSONWebTokenStorage.swift
//  AcelanProgress
//
//  Created by Mikhail Yeremeyev on 01.05.2023.
//

import Foundation
import WebClient

final class JSONWebTokenStorage: AuthorizationTokenStorage {

    private let accessTokenKey = "JSONWebTokenStorage_accessToken"
    
    func update(accessToken: String, refreshToken: String?) {
        UserDefaults.standard.set(accessToken, forKey: accessTokenKey)
    }
    
    func getToken(byType tokenType: TokenType) -> String? {
        UserDefaults.standard.string(forKey: accessTokenKey)
    }
    
    func clearToken() {
        UserDefaults.standard.set(nil, forKey: accessTokenKey)
    }
    
}
