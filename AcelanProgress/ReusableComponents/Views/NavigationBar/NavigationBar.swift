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
    
    init(title: String, leadingItem: NavigationBarItem? = nil) {
        self.title = title
        self.leadingItem = leadingItem
    }
    
    var body: some View {
        ZStack {
            Color.resource(.White)
            
            Text(title)
                .font(.system(size: 17, weight: .semibold))
                .foregroundColor(.resource(.Black))
            
            Separator()
                .alignment(.bottom)
            
            if case let .backButton(action) = leadingItem {
                BackButton(action: action)
                    .alignment(.leading)
                    .padding(.leading, 16)
            }
        }
        .frame(height: 44)
    }
    
}

struct NavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBar(title: "Login")
    }
}
