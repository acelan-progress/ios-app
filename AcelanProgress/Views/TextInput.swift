//
//  TextInput.swift
//  AcelanProgress
//
//  Created by Mikhail Eremeev on 22.04.2023.
//

import SwiftUI

struct TextInput: View {
    
    let title: String
    
    @Binding
    private var text: String
    
    init(title: String, text: Binding<String>) {
        self.title = title
        self._text = text
    }
    
    var body: some View {
        TextField(title, text: $text)
    }
    
}

struct TextInput_Previews: PreviewProvider {
    static var previews: some View {
        TextInput(
            title: "Email",
            text: .constant("email@example.com")
        ).padding(30)
    }
}
