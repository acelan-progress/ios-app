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
    var modelName = "airplane.ply"
    
}

extension ModelViewerMainState {
    
    var modelScene: SCNScene? {
        SCNScene(named: modelName)
    }
    
}
