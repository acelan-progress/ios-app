//
//  AcelanTextField.swift
//  AcelanProgress
//
//  Created by Mikhail Yeremeyev on 22.04.2023.
//

import SwiftUI
import PNComponents

struct AcelanTextField: View {
    
    @StateObject
    private var state = AcelanTextFieldState()
    
    let title: String
    
    let placeholder: String
    
    @Binding
    private var text: String
    
    init(title: String, placeholder: String, text: Binding<String>) {
        self.title = title
        self.placeholder = placeholder
        _text = text
    }
    
    var body: some View {
        VStack(spacing: 5) {
            Text(title)
                .font(.system(size: 16, weight: .semibold))
                .foregroundColor(.resource(.Black))
                .alignment(.leading)
            
            TextInput(text: $text) { textField in
                state.setup(textField: textField)
                
                textField.font = .systemFont(ofSize: 16)
                textField.tintColor = .resource(.Purple)
                textField.textColor = .resource(.Black)
                textField.attributedPlaceholder = NSAttributedString(
                    string: placeholder,
                    attributes: [
                        .foregroundColor: UIColor.resource(.LightGray)
                    ]
                )
            }
            .frame(height: 40)
            .padding(.horizontal, 10)
            .overlay(
                buildTextInputOverlayView()
            )
        }
    }
    
    @ViewBuilder
    private func buildTextInputOverlayView() -> some View {
        RoundedRectangle(cornerRadius: 10)
            .stroke(
                Color.resource(state.focused ? .Purple : .LightGray),
                lineWidth: state.focused ? 2 : 1
            )
    }
}

struct AcelanTextField_Previews: PreviewProvider {
    static var previews: some View {
        AcelanTextField(
            title: "Email",
            placeholder: "email@example.com",
            text: .constant(.empty)
        ).padding(30)
    }
}
