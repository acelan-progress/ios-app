//
//  AcelanProgressApp.swift
//  AcelanProgress
//
//  Created by Mikhail Yeremeyev on 10.03.2023.
//

import SwiftUI
import StatefulArch
import AppConfiguration

@main
struct AcelanProgressApp: App {
    
    init() {
        AppConfiguration.setup(
            DIConfiguration.self,
            NavigationConfiguration.self,
            ErrorProcessorConfiguration.self
        )
    }
    
    var body: some Scene {
        WindowGroup {
            RootView()
                .ignoresSafeArea()
        }
    }
    
}
