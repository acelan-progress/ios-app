//
//  DecodingError.swift
//  AcelanProgress
//
//  Created by Mikhail Yeremeyev on 01.05.2023.
//

import Foundation

extension DecodingError: CustomStringConvertible {
    
    public var description: String {
        switch self {
            
        case .typeMismatch(let any, let context):
            return "Type mismatch for \'\(any)\': " + context.description
            
        case .valueNotFound(let any, let context):
            return "Value not found for type \'\(any)\': " + context.description
            
        case .keyNotFound(let codingKey, let context):
            return "Key not found for \'\(codingKey)\': " + context.description
            
        case .dataCorrupted(let context):
            return "Data corrupted: " + context.description
            
        @unknown default:
            return localizedDescription
        }
    }
    
}

extension DecodingError.Context: CustomStringConvertible {
    
    public var description: String {
        debugDescription + " Path: " + codingPath.map({ $0.stringValue }).joined(separator: "/")
    }
    
}
