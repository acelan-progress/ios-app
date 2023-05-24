//
//  ArtifactsMainPage.swift
//  AcelanProgress
//
//  Created by Mikhail Yeremeyev on 01.05.2023.
//

import SwiftUI
import StatefulArch

struct ArtifactsMainPage: PageView {
    
    @StateObject
    var state: ArtifactsMainState
    
    let interceptor: ArtifactsMainInterceptor
    
    var body: some View {
        VStack(spacing: .zero) {
            NavigationBar(title: "Artifacts")
            
            ScrollView {
                VStack(spacing: 10) {
                    ForEach(state.artifactItems) { artifactItem in
                        ArtifactItemView(
                            item: artifactItem,
                            action: {
                                interceptor.call(action: .openModelViewer(artifactItem))
                            }
                        )
                    }
                }
                .padding(.vertical, 10)
                .padding(.horizontal, 20)
            }
            .loading($state.loading)
        }
    }
    
}
