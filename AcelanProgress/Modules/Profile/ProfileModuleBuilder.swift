//
//  ProfileModuleBuilder.swift
//  AcelanProgress
//
//  Created by Mikhail Yeremeyev on 23.04.2023.
//

import Foundation
import StatefulArch

enum ProfileModuleBuilder: ModuleBuilder {

    case main
    
    func buildModule(serviceProvider: StatefulArch.ServiceProvider) -> StatefulArch.ModuleConvertible {
        let state = ProfileMainState()
        let interceptor = ProfileMainInterceptor(state: state, serviceProvider: serviceProvider)
        return ProfileMainPage(
            state: state,
            interceptor: interceptor
        ).asModule()
    }
    
}
