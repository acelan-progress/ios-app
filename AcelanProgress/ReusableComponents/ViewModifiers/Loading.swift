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
        if show {
            ZStack {
                content

                Color.clear
                
                VStack {
                    Spacer()
                    
                    Loader()
                    
                    Spacer()
                }
            }
            .ignoresSafeArea(.all)
        } else {
            content
        }
    }
    
}

extension View {
    
    func loading(show: Binding<Bool>) -> some View {
        modifier(Loading(show: show))
    }
    
}
