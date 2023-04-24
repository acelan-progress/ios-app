//
//  PrimaryButton.swift
//  AcelanProgress
//
//  Created by Mikhail Yeremeyev on 22.04.2023.
//

import SwiftUI
import PNComponents

struct PrimaryButton: View {
    
    let title: String
    let action: () -> Void
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .frame(height: 45)
                .foregroundColor(.resource(.Purple))
            
            Text(title)
                .font(.system(size: 16, weight: .bold))
                .foregroundColor(.resource(.White))
        }
        .buttonAction(action)
    }

}

struct PrimaryButton_Previews: PreviewProvider {
    static var previews: some View {
        PrimaryButton(
            title: "Login",
            action: {}
        ).padding(30)
    }
}
