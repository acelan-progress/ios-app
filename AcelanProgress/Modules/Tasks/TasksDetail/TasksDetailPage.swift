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
                        })
                )
                
                ScrollView {
                    VStack(alignment: .leading, spacing: 10) {
                        if let taskItem = state.taskItem {
                            TaskStatusView(
                                statusBackgroundColor: taskItem.statusBackgroundColor,
                                statusTitle: taskItem.status,
                                statusTitleColor: taskItem.statusTitleColor
                            )
                            
                            HLabel(title: "ID", content: taskItem.id)
                            HLabel(title: "Name", content: taskItem.name)
                            HLabel(title: "Started at", content: taskItem.startedAt)
                            HLabel(title: "Finished at", content: taskItem.finishedAt)
                            
                            if state.showArtifactButton {
                                PrimaryButton(
                                    title: state.artifactButtonTitle,
                                    action: {
                                        interceptor.call(action: .downloadArtifact)
                                    }
                                )
                            }
                        }
                    }
                    .padding(.vertical, 10)
                    .padding(.horizontal, 20)
                }
            }
            .loading($state.loading)
            
            if state.downloadingArtifact {
                Color.resource(.White)
                    .opacity(0.5)
                    .ignoresSafeArea()
                
                DownloadProgressView(progress: $state.artifactDownloadProgress)
            }
        }
    }
}

struct TasksDetailPage_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView()
    }
}
