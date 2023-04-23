//
//  TaskItem.swift
//  AcelanProgress
//
//  Created by Mikhail Yeremeyev on 23.04.2023.
//

import Foundation
import SwiftUI

enum TaskItem: TaskItemData {
    
    case acelanTask(AcelanTask)
    
    var id: Int {
        switch self {
        case let .acelanTask(acelanTask):
            return acelanTask.id
        }
    }
    
    var name: String {
        switch self {
        case let .acelanTask(acelanTask):
            return acelanTask.name
        }
    }
    
    var status: String {
        switch self {
        case let .acelanTask(acelanTask):
            return acelanTask.status.name
        }
    }
    
    var statusBackgroundColor: Color {
        switch self {
        case let .acelanTask(acelanTask):
            switch acelanTask.status {
            case .queued:
                return .resource(.LightGray)
                
            case .working:
                return .resource(.LightBlue)
                
            case .failure:
                return .resource(.Pink)
                
            case .success:
                return .resource(.LightGreen)
                
            case .unknown(_):
                return .resource(.Black)
            }
        }
    }

    var statusTitleColor: Color {
        switch self {
        case let .acelanTask(acelanTask):
            switch acelanTask.status {
            case .queued:
                return .resource(.Carbon)
            
            case .working:
                return .resource(.DarkBlue)
            
            case .failure:
                return .resource(.DarkRed)
            
            case .success:
                return .resource(.DarkGreen)
            
            case .unknown(_):
                return .resource(.Black)
            }
        }
    }
    
    var startedAt: String {
        switch self {
        case let .acelanTask(acelanTask):
            guard let startedAt = acelanTask.started_at else {
                return .dash
            }
            return AcelanTaskDateFormatter.format(startedAt)
        }
    }
    
    var finishedAt: String {
        switch self {
        case let .acelanTask(acelanTask):
            guard let finishedAt = acelanTask.finished_at else {
                return .dash
            }
            return AcelanTaskDateFormatter.format(finishedAt)
        }
    }
    
}
