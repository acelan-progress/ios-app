//
//  ArtifactItem.swift
//  AcelanProgress
//
//  Created by Mikhail Yeremeyev on 29.04.2023.
//

import Foundation

protocol ArtifactItemData: Identifiable {
    
    var id: String { get }
    var fileType: String { get }
    var url: String { get }
    
}

enum ArtifactItem: ArtifactItemData {
    
    case acelanTaskArtifact(AcelanTaskArtifact)
    
    var id: String {
        switch self {
        case let .acelanTaskArtifact(acelanTaskArtifact):
            return acelanTaskArtifact.id.asString()
        }
    }
    
    var fileType: String {
        switch self {
        case let .acelanTaskArtifact(acelanTaskArtifact):
            return acelanTaskArtifact.file_type
        }
    }
    
    var url: String {
        switch self {
        case let .acelanTaskArtifact(acelanTaskArtifact):
            return acelanTaskArtifact.url
        }
    }
    
}
