//
//  BackButton.swift
//  AcelanProgress
//
//  Created by Mikhail Yeremeyev on 25.04.2023.
//

import SwiftUI
import PNComponents

struct BackButton: View {

    let action: () -> Void
    
    var body: some View {
        ZStack {
            Color.clear
            
            Image.resourceTemplate(.icon_arrow_left)
                .foregroundColor(.resource(.Purple))
        }
        .frame(width: 24)
        .buttonAction(action)
    }
    
}
