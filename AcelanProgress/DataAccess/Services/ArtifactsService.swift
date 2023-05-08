//
//  ArtifactsService.swift
//  AcelanProgress
//
//  Created by Mikhail Yeremeyev on 02.05.2023.
//

import Foundation
import StatefulArch
import WebClient

final class ArtifactsService {
    
    private let webClient: WebClient
    
    init(serviceProvider: ServiceProvider) {
        self.webClient = serviceProvider.provideService()
    }
    
    func downloadArtifact(_ url: URL) {
        
    }
    
    func removeArtifact(_ url: URL) {
        
    }
    
}
