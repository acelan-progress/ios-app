//
//  TasksDetailState.swift
//  AcelanProgress
//
//  Created by Mikhail Yeremeyev on 25.04.2023.
//

import Foundation
import Combine

final class TasksDetailState: ObservableObject {
    
    let taskId: Int
    
    @Published
    var acelanTask: AcelanTask?
    
    @Published
    var loading = false
    
    @Published
    var artifactId: Int?
    
    init(taskId: Int) {
        self.taskId = taskId
    }
    
}

extension TasksDetailState {
    
    var taskHasArtifacts: Bool {
        guard let artifacts = acelanTask?.artifacts else {
            return false
        }
        return !artifacts.isEmpty
    }
    
    var taskItem: TaskItem? {
        guard let acelanTask else {
            return nil
        }
        return TaskItem.acelanTask(acelanTask)
    }
    
}
