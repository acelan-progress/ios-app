//
//  PrimaryButton.swift
//  AcelanProgress
//
//  Created by Mikhail Yeremeyev on 22.04.2023.
//

import SwiftUI

struct PrimaryButton: View {
    
    let title: String
    
    @Binding
    private var loading: Bool
    
    let action: () -> Void
    
    init(title: String, loading: Binding<Bool>, action: @escaping () -> Void) {
        self.title = title
        _loading = loading
        self.action = action
    }
    
    var body: some View {
        Button(action: action) {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .frame(height: 40)
                    .foregroundColor(.resource(.Purple))
                
                if loading {
                    ProgressView()
                        .progressViewStyle(
                            CircularProgressViewStyle(
                                tint: .resource(.White)
                            )
                        )
                } else {
                    Text(title)
                        .font(.system(size: 16, weight: .bold))
                        .foregroundColor(.resource(.White))
                }
            }
        }
    }

}

struct PrimaryButton_Previews: PreviewProvider {
    static var previews: some View {
        PrimaryButton(
            title: "Login",
            loading: .constant(false),
            action: {}
        ).padding(30)
    }
}
