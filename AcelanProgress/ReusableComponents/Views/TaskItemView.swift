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
                    VLabel(title: "ID:", content: item.id)
                    
                    Spacer()
                    
                    TaskStatusView(
                        statusBackgroundColor: item.statusBackgroundColor,
                        statusTitle: item.status,
                        statusTitleColor: item.statusTitleColor
                    )
                }

                VLabel(title: "Name:", content: item.name)
                VLabel(title: "Started at:", content: item.startedAt)
                VLabel(title: "Finished at:", content: item.finishedAt)
            }
            
            Spacer()
        }
        .background(Color.resource(.White))
        .padding(10)
        .overlay(ItemOverlayView())
        .buttonAction(action)
    }
    
}

struct TaskItemView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView()
    }
}
