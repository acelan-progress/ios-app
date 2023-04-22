//
//  TaskItemData.swift
//  AcelanProgress
//
//  Created by Mikhail Yeremeyev on 22.04.2023.
//

import Foundation
import SwiftUI

protocol TaskItemData: Identifiable {
    
    var id: Int { get }
    var name: String { get }
    var status: String { get }
    var statusColor: Color { get }
    var startedAt: String? { get }
    var finishedAt: String? { get }
    
}

#if DEBUG
enum TaskItemMock: String, CaseIterable, TaskItemData {
    
    case queued
    case working
    case failure
    case success
    
    var id: Int {
        switch self {
        case .queued:
            return 1
        
        case .working:
            return 2
            
        case .failure:
            return 3
            
        case .success:
            return 4
        }
    }
    
    var name: String {
        switch self {
        case .queued:
            return "Fresh"
        
        case .working:
            return "Still waiting..."
            
        case .failure:
            return "Bad task"
            
        case .success:
            return "Good task"
        }
    }
    
    var status: String {
        rawValue
    }
    
    var statusColor: Color {
        switch self {
        case .queued:
            return .resource(.Blue)
            
        case .working:
            return .resource(.Orange)
            
        case .failure:
            return .resource(.Red)
            
        case .success:
            return .resource(.Green)
        }
    }
    
    var startedAt: String? {
        switch self {
        case .queued:
            return nil
            
        case .working, .failure, .success:
            return "12.04.2023"
        }
    }
    
    var finishedAt: String? {
        switch self {
        case .queued, .working:
            return nil
            
        case .failure, .success:
            return "12.04.2023"
        }
    }
    
}
#endif
