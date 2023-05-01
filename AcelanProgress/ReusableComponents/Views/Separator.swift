//
//  Separator.swift
//  AcelanProgress
//
//  Created by Mikhail Yeremeyev on 25.04.2023.
//

import SwiftUI

struct Separator: View {
    
    var body: some View {
        Divider()
            .overlay(Color.resource(.LightGray))
    }
    
}

struct Separator_Previews: PreviewProvider {
    static var previews: some View {
        Separator()
    }
}
