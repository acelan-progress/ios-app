//
//  TaskItem.swift
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

enum TaskItem: TaskItemData {

    case acelanTask(AcelanTask)
    
    var id: String {
        switch self {
        case let .acelanTask(acelanTask):
            return acelanTask.id.asString()
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
            return acelanTask.acelanTaskStatus.name
        }
    }
    
    var statusBackgroundColor: Color {
        switch self {
        case let .acelanTask(acelanTask):
            return .resource(acelanTask.acelanTaskStatus.backgroundColorResource)
        }
    }
    
    var statusTitleColor: Color {
        switch self {
        case let .acelanTask(acelanTask):
            return .resource(acelanTask.acelanTaskStatus.titleColorResource)
        }
    }
    
    var startedAt: String {
        switch self {
        case let .acelanTask(acelanTask):
            if let startedAtDate = acelanTask.startedAtDate {
                return AcelanTaskDateFormatter.format(startedAtDate)
            }
            return .dash
        }
    }
    
    var finishedAt: String {
        switch self {
        case let .acelanTask(acelanTask):
            if let finishedAtDate = acelanTask.finishedAtDate {
                return AcelanTaskDateFormatter.format(finishedAtDate)
            }
            return .dash
        }
    }
    
}
