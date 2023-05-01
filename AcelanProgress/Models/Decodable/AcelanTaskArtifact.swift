//
//  AcelanTaskArtifact.swift
//  AcelanProgress
//
//  Created by Mikhail Yeremeyev on 23.04.2023.
//

import Foundation

struct AcelanTaskArtifact: Decodable {
    
    let id: Int
    let fileType: AcelanTaskFileType
    let url: URL
    
    enum CodingKeys: String, CodingKey {
        case id
        case fileType = "file_type"
        case url
    }
    
}
