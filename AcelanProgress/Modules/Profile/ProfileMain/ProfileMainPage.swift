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
            .padding(.vertical, 10)
            .padding(.horizontal, 20)
        }
        .loading(show: $state.loading)
    }
    
}

struct ProfileMainPage_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView()
    }
}
