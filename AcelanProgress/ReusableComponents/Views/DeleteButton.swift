//
//  DeleteButton.swift
//  AcelanProgress
//
//  Created by Mikhail Yeremeyev on 01.05.2023.
//

import SwiftUI
import PNComponents

struct DeleteButton: View {
    
    let action: () -> Void
    
    var body: some View {
        ZStack {
            Color.clear
            
            Image.resourceTemplate(.icon_trash)
                .foregroundColor(.resource(.DarkRed))
        }
        .frame(width: 24)
        .buttonAction(action)
    }
    
}
