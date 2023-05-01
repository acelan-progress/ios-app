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
        ScrollView {
            VStack(spacing: 15) {
                Image.resource(.image_acelan_logo)
                
                PrimaryTextField(
                    title: "Email",
                    placeholder: "Enter email",
                    text: $state.email,
                    keyboardType: .email
                )
                
                PrimaryTextField(
                    title: "Password",
                    placeholder: "Enter password",
                    text: $state.password,
                    keyboardType: .password,
                    isSecureTextEntry: true
                )
                
                PrimaryButton(
                    title: "Log In",
                    action: {
                        interceptor.call(action: .performLogin)
                    }
                )
                
                Spacer()
            }
            .padding(.horizontal, 20)
            .allowsHitTesting(!state.loading)
        }
        .loading($state.loading)
    }

}

struct LoginMainPage_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView()
    }
}
