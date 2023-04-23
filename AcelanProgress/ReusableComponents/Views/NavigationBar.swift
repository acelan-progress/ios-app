//
//  NavigationBar.swift
//  AcelanProgress
//
//  Created by Mikhail Yeremeyev on 22.04.2023.
//

import SwiftUI

struct NavigationBar: View {
    
    let title: String
    
    var body: some View {
        VStack {
            Text(title)
                .font(.system(size: 17, weight: .semibold))
                .foregroundColor(.resource(.Black))
                .frame(height: 43)
            
            Rectangle()
                .frame(height: 0.5)
                .overlay(Color.resource(.LightGray))
        }
        .background(Color.resource(.White))
    }
    
}

struct NavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBar(title: "Login")
    }
}
