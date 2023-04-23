//
//  TaskItemView.swift
//  AcelanProgress
//
//  Created by Mikhail Yeremeyev on 22.04.2023.
//

import SwiftUI
import PNComponents

struct TaskItemView<Item: TaskItemData>: View {
    
    let item: Item
    let action: () -> Void
    
    var body: some View {

        HStack {
            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    buildLabelView(title: "ID:", content: item.id)
                    
                    Spacer()
                    
                    buildStatusView()
                }

                buildLabelView(title: "Name:", content: item.name)
                buildLabelView(title: "Started at:", content: item.startedAt)
                buildLabelView(title: "Finished at:", content: item.finishedAt)
            }
            
            Spacer()
        }
        .background(Color.resource(.White))
        .padding(10)
        .overlay(buildTaskItemOverlay())
        .buttonAction(action)
    }
    
    @ViewBuilder
    private func buildStatusView() -> some View {
        ZStack {
            Capsule()
                .foregroundColor(item.statusBackgroundColor)
            
            Text(item.status)
                .font(.system(size: 14, weight: .semibold))
                .foregroundColor(item.statusTitleColor)
        }
        .frame(width: 80, height: 25)
    }
    
    @ViewBuilder
    private func buildLabelView(title: String, content: String) -> some View {
        HStack(alignment: .top, spacing: 5) {
            Text(title)
                .font(.system(size: 14, weight: .semibold))
                .foregroundColor(.resource(.DarkGray))
            
            Text(content)
                .font(.system(size: 14, weight: .semibold))
                .foregroundColor(.resource(.Black))
        }
        .frame(height: 25)
    }
    
    @ViewBuilder
    private func buildTaskItemOverlay() -> some View {
        RoundedRectangle(cornerRadius: 10)
            .stroke(lineWidth: 1)
            .foregroundColor(.resource(.LightGray))
    }
    
}

struct TaskItemView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                ForEach(TaskItemMock.allCases) { taskItem in
                    TaskItemView(item: taskItem, action: {})
                }
            }
            .padding(30)
        }
    }
}
