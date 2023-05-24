//
//  NavigationBar.swift
//  AcelanProgress
//
//  Created by Mikhail Yeremeyev on 22.04.2023.
//

import SwiftUI
import PNComponents

struct NavigationBar: View {
    
    let title: String
    let leadingItem: NavigationBarItem?
    let trailingItem: NavigationBarItem?
    
    init(title: String, leadingItem: NavigationBarItem? = nil, trailingItem: NavigationBarItem? = nil) {
        self.title = title
        self.leadingItem = leadingItem
        self.trailingItem = trailingItem
    }
    
    var body: some View {
        ZStack {
            Color.resource(.White)
            
            Text(title)
                .font(.system(size: 17, weight: .semibold))
                .foregroundColor(.resource(.Black))
            
            Separator()
                .alignment(.bottom)
            
            HStack {
                if case let .backButton(action) = leadingItem {
                    BackButton(action: action)
                }
                
                Spacer()
                
                if case let .deleteButton(action) = trailingItem {
                    DeleteButton(action: action)
                }
            }
            .padding(.horizontal, 16)
        }
        .frame(height: 44)
    }
    
}
