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
