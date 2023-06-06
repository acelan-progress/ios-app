//
//  PrimaryTextField.swift
//  AcelanProgress
//
//  Created by Mikhail Yeremeyev on 22.04.2023.
//

import SwiftUI
import PNComponents

struct PrimaryTextField: View {
    
    @StateObject
    private var state = PrimaryTextFieldState()
    
    let title: String
    let placeholder: String
    let keyboardType: PrimaryTextFieldKeyboardType
    let isSecureTextEntry: Bool
    
    @Binding
    private var text: String
    
    init(title: String, placeholder: String, text: Binding<String>, keyboardType: PrimaryTextFieldKeyboardType = .default, isSecureTextEntry: Bool = false) {
        self.title = title
        self.placeholder = placeholder
        self.keyboardType = keyboardType
        self.isSecureTextEntry = isSecureTextEntry
        self._text = text
    }
    
    var body: some View {
        VStack(spacing: 5) {
            Text(title)
                .font(.system(size: 16, weight: .semibold))
                .foregroundColor(.resource(.Black))
                .alignment(.leading)
            
            TextInput(text: $text) { textField in
                state.setup(textField: textField)
                
                textField.keyboardType = getUIKeyboardType()
                textField.font = .systemFont(ofSize: 16)
                textField.tintColor = .resource(.Purple)
                textField.textColor = .resource(.Black)
                textField.isSecureTextEntry = isSecureTextEntry
                textField.attributedPlaceholder = NSAttributedString(
                    string: placeholder,
                    attributes: [
                        .foregroundColor: UIColor.resource(.LightGray)
                    ]
                )
            }
            .frame(height: 45)
            .padding(.horizontal, 10)
            .overlay(buildTextInputOverlayView())
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
    
    private func getUIKeyboardType() -> UIKeyboardType {
        switch keyboardType {
        case .email:
            return .emailAddress
            
        case .default, .password:
            return .default
        }
    }

}
