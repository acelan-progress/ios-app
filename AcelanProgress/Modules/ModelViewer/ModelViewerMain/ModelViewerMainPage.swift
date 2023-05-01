//
//  ModelViewerMainPage.swift
//  AcelanProgress
//
//  Created by Mikhail Yeremeyev on 01.05.2023.
//

import SwiftUI
import StatefulArch
import SceneKit

struct ModelViewerMainPage: PageView {
    
    @StateObject
    var state: ModelViewerMainState
    
    let interceptor: ModelViewerMainInterceptor
    
    var body: some View {
        VStack(spacing: .zero) {
            NavigationBar(
                title: "Model Viewer",
                leadingItem: .backButton(action: {
                    interceptor.call(action: .goBack)
                }),
                trailingItem: .deleteButton(action: {
                    interceptor.call(action: .deleteModel)
                })
            )
            
            SceneView(
                scene: SCNScene(named: state.modelName),
                options: [.allowsCameraControl, .autoenablesDefaultLighting]
            )
        }
    }
}

struct ModelViewerPage_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView()
    }
}
