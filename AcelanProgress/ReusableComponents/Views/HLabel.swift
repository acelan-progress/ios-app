//
//  HLabel.swift
//  AcelanProgress
//
//  Created by Mikhail Yeremeyev on 27.04.2023.
//

import SwiftUI

struct HLabel: View {
    
    let title: String
    let content: String
    
    var body: some View {
        HStack(alignment: .top, spacing: 5) {
            Text(title)
                .font(.system(size: 16))
                .foregroundColor(.resource(.DarkGray))
            
            Text(content)
                .font(.system(size: 16))
                .foregroundColor(.resource(.Black))
        }
        .frame(height: 25)
    }
}
