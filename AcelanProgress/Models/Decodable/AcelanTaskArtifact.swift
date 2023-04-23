//
//  AcelanTaskArtifact.swift
//  AcelanProgress
//
//  Created by Mikhail Yeremeyev on 23.04.2023.
//

import Foundation

struct AcelanTaskArtifact: Decodable {
    
    let id: Int
    let file_type: AcelanTaskFileType
    let url: URL
    
}
