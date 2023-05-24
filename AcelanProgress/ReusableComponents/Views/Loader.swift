//
//  Loader.swift
//  AcelanProgress
//
//  Created by Mikhail Yeremeyev on 24.04.2023.
//

import SwiftUI

struct Loader: View {
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 60, height: 60)
                .foregroundColor(.resource(.DarkGray))
            
            ProgressView()
                .progressViewStyle(
                    CircularProgressViewStyle(tint: .resource(.White))
                )
        }
    }
    
}
