//
//  LoginModuleBuilder.swift
//  AcelanProgress
//
//  Created by Mikhail Yeremeyev on 22.04.2023.
//

import Foundation
import StatefulArch

enum LoginModuleBuilder: ModuleBuilder {
    
    case main
    
    func buildModule(serviceProvider: ServiceProvider) -> ModuleConvertible {
        switch self {
        case .main:
            let state = LoginMainState()
            let interceptor = LoginMainInterceptor(state: state, serviceProvider: serviceProvider)
            return LoginMainPage(
                state: state,
                interceptor: interceptor
            ).asNavigationModule()
        }
    }
    
}
