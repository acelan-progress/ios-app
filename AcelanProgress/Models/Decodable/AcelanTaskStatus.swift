//
//  AcelanTaskStatus.swift
//  AcelanProgress
//
//  Created by Mikhail Yeremeyev on 23.04.2023.
//

import Foundation

enum AcelanTaskStatus: Decodable {
    
    case queued
    case working
    case failure
    case success
    case unknown(String)
    
    init(from decoder: Decoder) throws {
        let valueContainer = try decoder.singleValueContainer()
        let decodedValue = try valueContainer.decode(String.self)
        
        switch decodedValue {
        case "queued":
            self = .queued
            
        case "working":
            self = .working
            
        case "failure":
            self = .failure
            
        case "success":
            self = .success
            
        default:
            self = .unknown(decodedValue)
        }
    }
    
    var name: String {
        var name: String = .empty
        switch self {
        case .queued:
            name = "queued"
        
        case .working:
            name = "working"
        
        case .failure:
            name = "failure"
        
        case .success:
            name = "success"
            
        case let .unknown(unknownName):
            name = unknownName
        }
        
        return name.capitalized
    }
    
}
