//
//  ItemOverlayView.swift
//  AcelanProgress
//
//  Created by Mikhail Yeremeyev on 01.05.2023.
//

import SwiftUI

struct ItemOverlayView: View {
    
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .stroke(lineWidth: 1)
            .foregroundColor(.resource(.LightGray))
    }
    
}

struct ItemOverlayView_Previews: PreviewProvider {
    static var previews: some View {
        Rectangle()
            .frame(width: 50, height: 50)
            .foregroundColor(.resource(.Black))
            .overlay(ItemOverlayView())
    }
}
