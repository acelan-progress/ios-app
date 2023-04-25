//
//  AcelanLabel.swift
//  AcelanProgress
//
//  Created by Mikhail Yeremeyev on 23.04.2023.
//

import SwiftUI

struct AcelanLabel: View {
    
    let title: String
    let content: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(title)
                .font(.system(size: 14))
                .foregroundColor(.resource(.DarkGray))
            
            Text(content)
                .font(.system(size: 16))
                .foregroundColor(.resource(.Black))
        }
    }

}

struct AcelanLabel_Previews: PreviewProvider {
    static var previews: some View {
        AcelanLabel(
            title: "Email",
            content: "email@example.com"
        ).padding(20)
    }
}
