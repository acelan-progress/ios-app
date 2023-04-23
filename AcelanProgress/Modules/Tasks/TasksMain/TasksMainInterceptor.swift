//
//  TasksMainInterceptor.swift
//  AcelanProgress
//
//  Created by Mikhail Yeremeyev on 23.04.2023.
//

import Foundation
import StatefulArch

final class TasksMainInterceptor: PageInterceptor<TasksMainAction, TasksMainState> {
    
    override func handle(action: TasksMainAction) async {
        switch action {
        case let .openTaskItemDetail(taskItem):
            break
        }
    }
    
}
