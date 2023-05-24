//
//  TasksDetailPage.swift
//  AcelanProgress
//
//  Created by Mikhail Yeremeyev on 25.04.2023.
//

import SwiftUI
import StatefulArch

struct TasksDetailPage: PageView {
    
    @StateObject
    var state: TasksDetailState
    
    let interceptor: TasksDetailInterceptor
    
    var body: some View {
        ZStack {
            VStack(spacing: .zero) {
                NavigationBar(
                    title: "Task Details",
                    leadingItem: .backButton(
                        action: {
                            interceptor.call(action: .goBack)
                        }
                    )
                )
                
                ScrollView {
                    VStack(alignment: .leading, spacing: 10) {
                        if let taskItem = state.taskItem {
                            TaskStatusView(
                                statusBackgroundColor: taskItem.statusBackgroundColor,
                                statusTitle: taskItem.status,
                                statusTitleColor: taskItem.statusTitleColor
                            )
                            
                            VLabel(title: "ID", content: taskItem.id)
                            VLabel(title: "Name", content: taskItem.name)
                            VLabel(title: "Started at", content: taskItem.startedAt)
                            VLabel(title: "Finished at", content: taskItem.finishedAt)
                            
                            if state.taskHasArtifacts {
                                if !state.artifactDownloaded {
                                    PrimaryButton(
                                        title: "Download Artifact",
                                        action: {
                                            interceptor.call(action: .downloadArtifact)
                                        }
                                    )
                                } else if let artifactId = state.artifactId {
                                    PrimaryButton(
                                        title: "View Artifact",
                                        action: {
                                            interceptor.call(action: .openModelViewer(artifactId: artifactId))
                                        }
                                    )
                                }
                                    
                            }
                        }
                    }
                    .padding(.vertical, 10)
                    .padding(.horizontal, 20)
                }
            }
            .loading($state.loading)
        }
    }
}

struct TasksDetailPage_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView()
    }
}
