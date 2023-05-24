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
        VStack(spacing: .zero) {
            NavigationBar(title: "Profile")
            
            VStack(alignment: .leading, spacing: 10) {
                VLabel(title: "Email", content: state.email)
                
                SecondaryButton(
                    title: "Log Out",
                    action: {
                        interceptor.call(action: .performLogout)
                    }
                )
                
                Spacer()
            }
            .padding(.vertical, 10)
            .padding(.horizontal, 20)
            .loading($state.loading)
        }
    }
    
}
