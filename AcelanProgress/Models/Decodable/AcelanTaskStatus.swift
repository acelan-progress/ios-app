//
//  AcelanTaskStatus.swift
//  AcelanProgress
//
//  Created by Mikhail Yeremeyev on 23.04.2023.
//

import Foundation
import SwiftUI

enum AcelanTaskStatus: String {
    
    case queued
    case working
    case failure
    case success
    case unknown
    
    var name: String {
        rawValue.capitalized
    }
    
    var backgroundColorResource: ColorResource {
        switch self {
        case .queued, .unknown:
            return .LightGray
        
        case .working:
            return .LightBlue
        
        case .failure:
            return .Pink
        
        case .success:
            return .LightGreen
        }
    }
    
    var titleColorResource: ColorResource {
        switch self {
        case .queued, .unknown:
            return .DarkGray
        
        case .working:
            return .DarkBlue
        
        case .failure:
            return .DarkRed
        
        case .success:
            return .DarkGreen
        }
    }
    
}
