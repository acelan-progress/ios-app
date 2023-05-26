//
//  ArtifactsMainState.swift
//  AcelanProgress
//
//  Created by Mikhail Yeremeyev on 27.04.2023.
//

import Foundation
import Combine

final class ArtifactsMainState: ObservableObject {
    
    @Published
    var loading = false
    
    @Published
    var acelanTaskArtifacts = [AcelanTaskArtifact]()
    
}

extension ArtifactsMainState {
    
    var artifactItems: [ArtifactItem] {
        acelanTaskArtifacts.map(ArtifactItem.acelanTaskArtifact)
    }
    
}
