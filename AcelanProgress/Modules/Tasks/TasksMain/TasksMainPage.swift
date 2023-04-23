//
//  TasksMainPage.swift
//  AcelanProgress
//
//  Created by Mikhail Yeremeyev on 23.04.2023.
//

import SwiftUI
import StatefulArch

struct TasksMainPage: PageView {
    
    @StateObject
    var state: TasksMainState
    
    let interceptor: TasksMainInterceptor
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                ForEach(state.taskItems) { taskItem in
                    TaskItemView(
                        item: taskItem,
                        action: {
                            interceptor.call(action: .openTaskItemDetail(taskItem))
                        }
                    )
                }
            }
            .padding(.top, 64)
            .padding(.bottom, 10)
            .padding(.horizontal, 20)
        }
        .overlay(NavigationBar(title: "Tasks"), alignment: .top)
    }
    
}

struct TasksMainPage_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView()
    }
}
