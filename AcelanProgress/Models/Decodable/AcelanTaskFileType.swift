//
//  AcelanTaskFileType.swift
//  AcelanProgress
//
//  Created by Mikhail Yeremeyev on 23.04.2023.
//

import Foundation

enum AcelanTaskFileType: String, Decodable {
    
    case ply
    case unknown
    
    var name: String {
        rawValue
    }
    
}
