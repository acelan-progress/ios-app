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
    
    @Published
    var downloadingArtifact: Bool
    
    @Published
    var artifactDownloadProgress: Double
    
    init(taskId: Int, acelanTask: AcelanTask? = nil, loading: Bool = false, downloadingArtifact: Bool = false, downloadingArtifactProgress: Double = .zero) {
        self.taskId = taskId
        self.acelanTask = acelanTask
        self.loading = loading
        self.downloadingArtifact = downloadingArtifact
        self.artifactDownloadProgress = downloadingArtifactProgress
    }
    
}

extension TasksDetailState {
    
    var taskItem: TaskItem? {
        if let acelanTask {
            return TaskItem.task(acelanTask)
        }
        return nil
    }
    
    var showArtifactButton: Bool {
        guard let artifacts = acelanTask?.artifacts else {
            return false
        }
        return !artifacts.isEmpty
    }
    
    var artifactButtonTitle: String {
        artifactDownloaded ? "View Artifact" : "Download Artifact"
    }
    
    var artifactDownloaded: Bool {
        false
    }
    
}
