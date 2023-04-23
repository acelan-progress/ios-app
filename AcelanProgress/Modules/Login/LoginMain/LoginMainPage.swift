//
//  LoginMainPage.swift
//  AcelanProgress
//
//  Created by Mikhail Yeremeyev on 22.04.2023.
//

import SwiftUI
import StatefulArch

struct LoginMainPage: PageView {
    
    @StateObject
    var state: LoginMainState
    
    let interceptor: LoginMainInterceptor
    
    var body: some View {
        VStack(spacing: 15) {
            Image.resource(.image_acelan_logo)
                .padding(.top, 10)
            
            AcelanTextField(
                title: "Email",
                placeholder: "Enter email",
                text: $state.email
            )
            
            AcelanTextField(
                title: "Password",
                placeholder: "Enter password",
                text: $state.password
            )
            
            PrimaryButton(
                title: "Login",
                loading: $state.loading,
                action: {
                    interceptor.call(action: .performLogin)
                }
            )
            
            Spacer()
        }
        .allowsHitTesting(!state.loading)
        .padding(.horizontal, 30)
    }

}

struct LoginMainPage_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView()
    }
}
