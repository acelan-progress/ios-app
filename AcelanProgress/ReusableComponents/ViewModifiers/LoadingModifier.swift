//
//  LoadingModifier.swift
//  AcelanProgress
//
//  Created by Mikhail Yeremeyev on 24.04.2023.
//

import SwiftUI

struct LoadingModifier: ViewModifier {
    
    @Binding
    var loading: Bool
    
    func body(content: Content) -> some View {
        if loading {
            ZStack {
                Color.resource(.White)
                
                VStack {
                    Spacer()
                    
                    Loader()
                    
                    Spacer()
                }
            }
        } else {
            content
        }
    }
    
}

extension View {
    
    func withLoading(_ loading: Binding<Bool>) -> some View {
        modifier(LoadingModifier(loading: loading))
    }
    
}
