//
//  ModelViewerBuilder.swift
//  AcelanProgress
//
//  Created by Mikhail Yeremeyev on 01.05.2023.
//

import Foundation
import StatefulArch

enum ModelViewerBuilder: ModuleBuilder {
    
    case main
    
    func buildModule(serviceProvider: ServiceProvider) -> ModuleConvertible {
        switch self {
        case .main:
            let state = ModelViewerMainState()
            let interceptor = ModelViewerMainInterceptor(state: state, serviceProvider: serviceProvider)
            return ModelViewerMainPage(
                state: state,
                interceptor: interceptor
            ).asModule(hidesBottomBarWhenPushed: true)
        }
    }
    
}
