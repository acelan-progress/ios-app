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
    var loading: Bool
    
    init(taskId: Int, acelanTask: AcelanTask? = nil, loading: Bool = false) {
        self.taskId = taskId
        self.acelanTask = acelanTask
        self.loading = loading
    }
    
}

extension TasksDetailState {
    
    var taskItem: TaskItem? {
        if let acelanTask {
            return TaskItem.task(acelanTask)
        }
        return nil
    }
    
}
