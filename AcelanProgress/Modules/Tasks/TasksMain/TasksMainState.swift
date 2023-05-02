//
//  TasksMainState.swift
//  AcelanProgress
//
//  Created by Mikhail Yeremeyev on 23.04.2023.
//

import Foundation
import Combine

final class TasksMainState: ObservableObject {
    
    @Published
    var tasks: [AcelanTask] = []
    
    @Published
    var loading: Bool = true
    
}

extension TasksMainState {
    
    var taskItems: [TaskItem] {
        tasks.map(TaskItem.task)
    }
    
}
