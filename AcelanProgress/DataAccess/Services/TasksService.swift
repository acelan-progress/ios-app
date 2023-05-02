//
//  TasksService.swift
//  AcelanProgress
//
//  Created by Mikhail Yeremeyev on 01.05.2023.
//

import Foundation
import StatefulArch

final class TasksService {
    
    private let apiClient: ApiClient
    
    init(serviceProvider: ServiceProvider) {
        apiClient = serviceProvider.provideService()
    }
    
    func getTasks() async throws -> [AcelanTask] {
        let tasksResponse: TasksResponse = try await apiClient.request(with: .getTasksParameters())
        return tasksResponse.tasks
    }
    
    func getTask(taskId: Int) async throws -> AcelanTask {
        try await apiClient.request(with: .getTaskParameters(taskId: taskId))
    }
    
}
