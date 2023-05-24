//
//  ModelViewerModuleBuilder.swift
//  AcelanProgress
//
//  Created by Mikhail Yeremeyev on 01.05.2023.
//

import Foundation
import StatefulArch

enum ModelViewerModuleBuilder: ModuleBuilder {
    
    case main(artifactId: Int)
    
    func buildModule(serviceProvider: ServiceProvider) -> ModuleConvertible {
        switch self {
        case let .main(artifactId):
            let state = ModelViewerMainState(artifactId: artifactId)
            let interceptor = ModelViewerMainInterceptor(state: state, serviceProvider: serviceProvider)
            return ModelViewerMainPage(
                state: state,
                interceptor: interceptor
            ).asModule(hidesBottomBarWhenPushed: true)
        }
    }
    
}
