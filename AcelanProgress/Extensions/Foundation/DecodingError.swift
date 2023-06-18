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
        case let .typeMismatch(any, context):
            return "Type mismatch for \'\(any)\': \(context.description)"
            
        case let .valueNotFound(any, context):
            return "Value not found for type \'\(any)\': \(context.description)"
            
        case let .keyNotFound(codingKey, context):
            return "Key not found for \'\(codingKey)\': \(context.description)"
            
        case let .dataCorrupted(context):
            return "Data corrupted: \(context.description)"
            
        @unknown default:
            return localizedDescription
        }
    }
    
}

extension DecodingError.Context: CustomStringConvertible {
    
    public var description: String {
        debugDescription + " Path: " + codingPath.map { $0.stringValue }.joined(separator: "/")
    }
    
}
