//
//  AcelanTaskFileType.swift
//  AcelanProgress
//
//  Created by Mikhail Yeremeyev on 23.04.2023.
//

import Foundation

enum AcelanTaskFileType: Decodable {
    
    case ply
    case unknown(String)
    
    init(from decoder: Decoder) throws {
        let valueContainer = try decoder.singleValueContainer()
        let decodedValue = try valueContainer.decode(String.self)
        
        switch decodedValue {
        case "ply":
            self = .ply

        default:
            self = .unknown(decodedValue)
        }
    }
    
    var name: String {
        var name: String = .empty
        
        switch self {
        case .ply:
            name = "ply"

        case let .unknown(unknownName):
            name = unknownName
        }
        
        return name.capitalized
    }
    
}
