//
//  TaskStatusView.swift
//  AcelanProgress
//
//  Created by Mikhail Yeremeyev on 27.04.2023.
//

import SwiftUI

struct TaskStatusView: View {
    
    let statusBackgroundColor: Color
    let statusTitle: String
    let statusTitleColor: Color
    
    var body: some View {
        ZStack {
            Capsule()
                .foregroundColor(statusBackgroundColor)
            
            Text(statusTitle)
                .font(.system(size: 14, weight: .semibold))
                .foregroundColor(statusTitleColor)
                .padding(.horizontal, 8)
        }
        .fixedSize(horizontal: true, vertical: false)
        .frame(height: 25)
    }
    
}
