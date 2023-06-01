//
//  ApiClient.swift
//  AcelanProgress
//
//  Created by Mikhail Yeremeyev on 01.05.2023.
//

import Foundation
import StatefulArch
import WebClient

final class ApiClient {
    
    private let webClient: WebClient
    
    init(serviceProvider: ServiceProvider) {
        self.webClient = serviceProvider.provideService()
    }
    
    func request<D: Decodable>(with paramerers: RequestParameters) async throws -> D {
        let response = try await webClient.request(with: paramerers)
        
        if let responseError = response.error {
            throw responseError
        }
        
        let result: D = try response.asDecodable()
        return result
    }
    
}
