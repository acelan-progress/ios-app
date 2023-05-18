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
    
    let downloadManager: DownloadManager
    
    init(serviceProvider: ServiceProvider) {
        self.downloadManager = serviceProvider.provideService()
    }
    
}
