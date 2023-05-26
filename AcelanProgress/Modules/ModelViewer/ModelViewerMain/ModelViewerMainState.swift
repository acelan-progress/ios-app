//
//  ModelViewerMainState.swift
//  AcelanProgress
//
//  Created by Mikhail Yeremeyev on 01.05.2023.
//

import Foundation
import Combine
import SceneKit

final class ModelViewerMainState: ObservableObject {
    
    @Published
    var modelFilename: String?
    
    @Published
    var loading = false
    
    let artifactId: Int
    
    init(artifactId: Int) {
        self.artifactId = artifactId
    }
    
}

extension ModelViewerMainState {
    
    var modelScene: SCNScene? {
        guard let modelFileURL = modelFilename?.modelFileURL else {
            return nil
        }

        return try? SCNScene(url: modelFileURL)
    }
    
}
