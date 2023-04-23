//
//  TaskItemView.swift
//  AcelanProgress
//
//  Created by Mikhail Yeremeyev on 22.04.2023.
//

import SwiftUI

struct TaskItemView<Item: TaskItemData>: View {
    
    let item: Item
    
    var body: some View {
        VStack(spacing: 10) {
            HStack {
                buildStatusView()
            }
        }
    }
    
    @ViewBuilder
    private func buildStatusView() -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(item.statusBackgroundColor)
            
            Text(item.status)
                .font(.system(size: 14, weight: .semibold))
                .foregroundColor(item.statusTitleColor)
        }
        .frame(width: 30, height: 10)
    }
    
    @ViewBuilder
    private func buildLabelView(title: String, content: String) -> some View {
        HStack(spacing: 5) {
            
        }
    }
    
}

struct TaskItemView_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 10) {
            ForEach(TaskItemMock.allCases) { taskItem in
                TaskItemView(item: taskItem)
            }
        }
    }
}
