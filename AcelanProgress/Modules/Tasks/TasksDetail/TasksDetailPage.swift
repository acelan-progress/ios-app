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
                    TaskStatusView(
                        statusBackgroundColor: .resource(.Pink),
                        statusTitle: "Failure",
                        statusTitleColor: .resource(.DarkRed)
                    )
                    
                    HLabel(title: "ID", content: "1")
                    
                    HLabel(title: "Name", content: "Name")
                    
                    HLabel(title: "Started at", content: "12.04.2023, 14:30")
                    
                    HLabel(title: "Finished at", content: "12.04.2023, 15:30")
                }
                .padding(.vertical, 10)
                .padding(.horizontal, 20)
            }
        }
    }
}

struct TasksDetailPage_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView()
    }
}
