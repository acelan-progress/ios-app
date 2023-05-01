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
    var artifactItems = ArtifactItemMock.allCases
    
    @Published
    var loading = false
    
}
