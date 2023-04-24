//
//  Loading.swift
//  AcelanProgress
//
//  Created by Mikhail Yeremeyev on 24.04.2023.
//

import SwiftUI

struct Loading: ViewModifier {
    
    @Binding
    var show: Bool
    
    func body(content: Content) -> some View {
        if !show {
            content
        } else {
            content
                .overlay(Loader())
                .ignoresSafeArea()
                .allowsHitTesting(false)
        }
    }
    
}

extension View {
    
    func loading(show: Binding<Bool>) -> some View {
        modifier(Loading(show: show))
    }
    
}
