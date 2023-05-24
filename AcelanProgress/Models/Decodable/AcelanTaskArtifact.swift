//
//  AcelanTaskArtifact.swift
//  AcelanProgress
//
//  Created by Mikhail Yeremeyev on 23.04.2023.
//

import Foundation

struct AcelanTaskArtifact: Decodable {
    
    let id: Int
    let file_type: String
    let url: String
    
    var fileType: AcelanTaskFileType {
        AcelanTaskFileType(rawValue: file_type) ?? .unknown
    }
    
    var artifactSourceURL: URL? {
        URL(string: url)
    }
    
    static func create(from artifact: Artifact) -> AcelanTaskArtifact {
        AcelanTaskArtifact(id: artifact.id, file_type: artifact.fileType, url: artifact.remoteURL)
    }
    
}
