//
//  ArtifactsMainInterceptor.swift
//  AcelanProgress
//
//  Created by Mikhail Yeremeyev on 01.05.2023.
//

import Foundation
import StatefulArch

final class ArtifactsMainInterceptor: PageInterceptor<ArtifactsMainAction, ArtifactsMainState> {
    
    override func handle(action: ArtifactsMainAction) async {
        switch action {
        case let .openModelViewer(artifactItem):
            NavigationService.push(using: ModelViewerModuleBuilder.main)
        }
    }
    
}
