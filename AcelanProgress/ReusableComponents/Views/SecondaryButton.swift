//
//  SecondaryButton.swift
//  AcelanProgress
//
//  Created by Mikhail Yeremeyev on 23.04.2023.
//

import SwiftUI
import PNComponents

struct SecondaryButton: View {
    
    let title: String
    let action: () -> Void
    
    var body: some View {
        ZStack {
            Color.resource(.White)
                .frame(height: 45)
            
            Text(title)
                .font(.system(size: 16, weight: .bold))
                .foregroundColor(.resource(.DarkRed))
        }
        .buttonAction(action)
    }
    
}

struct SecondaryButton_Previews: PreviewProvider {
    static var previews: some View {
        SecondaryButton(title: "Logout", action: {})
    }
}
