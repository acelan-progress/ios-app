//
//  ApiAuthorizationMethod.swift
//  AcelanProgress
//
//  Created by Mikhail Yeremeyev on 01.05.2023.
//

import Foundation
import WebClient

final class ApiAuthorizationMethod: AuthorizationMethod {
    
    public func preparedValue(using token: String?) -> String {
        guard let token else {
            return ""
        }

        return "Bearer \(token)"
    }
    
}
