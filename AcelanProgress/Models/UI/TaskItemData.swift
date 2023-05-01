//
//  TaskItemData.swift
//  AcelanProgress
//
//  Created by Mikhail Yeremeyev on 22.04.2023.
//

import Foundation
import SwiftUI

protocol TaskItemData: Identifiable {
    
    var id: String { get }
    var name: String { get }
    var status: String { get }
    var statusBackgroundColor: Color { get }
    var statusTitleColor: Color { get }
    var startedAt: String { get }
    var finishedAt: String { get }
    
}

#if DEBUG
enum TaskItemMock: String, CaseIterable, TaskItemData {

    case queued
    case working
    case failure
    case success
    
    var id: String {
        switch self {
        case .queued:
            return 1.asString()
        
        case .working:
            return 2.asString()
            
        case .failure:
            return 3.asString()
            
        case .success:
            return 4.asString()
        }
    }
    
    var name: String {
        switch self {
        case .queued:
            return "Fresh"
        
        case .working:
            return "Still waiting..."
            
        case .failure:
            return "Very very very very very very very very very bad task"
            
        case .success:
            return "Good task"
        }
    }
    
    var status: String {
        rawValue.capitalized
    }
    
    var statusBackgroundColor: Color {
        switch self {
        case .queued:
            return .resource(.LightGray)
            
        case .working:
            return .resource(.LightBlue)
            
        case .failure:
            return .resource(.Pink)
            
        case .success:
            return .resource(.LightGreen)
        }
    }
    
    var statusTitleColor: Color {
        switch self {
        case .queued:
            return .resource(.Carbon)
            
        case .working:
            return .resource(.DarkBlue)
            
        case .failure:
            return .resource(.DarkRed)
            
        case .success:
            return .resource(.DarkGreen)
        }
    }
    
    var startedAt: String {
        switch self {
        case .queued:
            return .dash
            
        case .working, .failure, .success:
            return "12.04.2023, 14:30"
        }
    }
    
    var finishedAt: String {
        switch self {
        case .queued, .working:
            return .dash
            
        case .failure, .success:
            return "12.04.2023, 15:30"
        }
    }
    
}
#endif