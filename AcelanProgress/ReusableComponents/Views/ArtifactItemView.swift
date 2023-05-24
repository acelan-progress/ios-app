//
//  ArtifactItemView.swift
//  AcelanProgress
//
//  Created by Mikhail Yeremeyev on 27.04.2023.
//

import SwiftUI
import PNComponents

struct ArtifactItemView<Item: ArtifactItemData>: View {
    
    let item: Item
    let action: () -> Void
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 10) {
                HLabel(title: "ID:", content: item.id)
                HLabel(title: "File type:", content: item.fileType)
                HLabel(title: "URL:", content: item.url)
            }
            
            Spacer()
        }
        .background(Color.resource(.White))
        .padding(10)
        .overlay(ItemOverlayView())
        .buttonAction(action)
    }
    
}
