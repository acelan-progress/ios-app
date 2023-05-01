//
//  ArtifactsModuleBuilder.swift
//  AcelanProgress
//
//  Created by Mikhail Yeremeyev on 27.04.2023.
//

import Foundation
import StatefulArch

enum ArtifactsModuleBuilder: ModuleBuilder {
    
    case main
    
    func buildModule(serviceProvider: ServiceProvider) -> ModuleConvertible {
        switch self {
        case .main:
            let state = ArtifactsMainState()
            let interceptor = ArtifactsMainInterceptor(state: state, serviceProvider: serviceProvider)
            return ArtifactsMainPage(
                state: state,
                interceptor: interceptor
            ).asNavigationModule()
        }
    }
    
}
