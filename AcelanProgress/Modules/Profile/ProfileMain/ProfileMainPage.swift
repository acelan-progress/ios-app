//
//  ProfileMainPage.swift
//  AcelanProgress
//
//  Created by Mikhail Yeremeyev on 23.04.2023.
//

import SwiftUI
import StatefulArch
import PNComponents

struct ProfileMainPage: PageView {
    
    @StateObject
    var state: ProfileMainState
    
    let interceptor: ProfileMainInterceptor
    
    var body: some View {
        let content = VStack(alignment: .leading, spacing: 10) {
            AcelanLabel(title: "Email", content: state.email)
                .alignment(.leading)
            
            SecondaryButton(
                title: "Logout",
                action: {
                    interceptor.call(action: .performLogout)
                }
            )
            
            Spacer()
        }
        .padding(.top, 64)
        .padding(.horizontal, 20)
        .overlay(NavigationBar(title: "Profile"), alignment: .top)
        
        if !state.loading {
            content
                .allowsHitTesting(!state.loading)
        } else {
            content.overlay(
                ProgressView()
                    .progressViewStyle(
                        CircularProgressViewStyle(tint: .resource(.Purple))
                    )
            )
            .ignoresSafeArea()
            .allowsHitTesting(!state.loading)
        }
    }
    
}

struct ProfileMainPage_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView()
    }
}
