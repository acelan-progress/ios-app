//
//  TasksDetailInterceptor.swift
//  AcelanProgress
//
//  Created by Mikhail Yeremeyev on 25.04.2023.
//

import Foundation
import StatefulArch

final class TasksDetailInterceptor: PageInterceptor<TasksDetailAction, TasksDetailState> {
    
    override func handle(action: TasksDetailAction) async {
        switch action {
        case .goBack:
            NavigationService.pop()
        }
    }
    
}
