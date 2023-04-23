//
//  TasksModuleBuilder.swift
//  AcelanProgress
//
//  Created by Mikhail Yeremeyev on 23.04.2023.
//

import Foundation
import StatefulArch

enum TasksModuleBuilder: ModuleBuilder {
    
    case main
    
    func buildModule(serviceProvider: ServiceProvider) -> ModuleConvertible {
        switch self {
        case .main:
            let state = TasksMainState()
            let interceptor = TasksMainInterceptor(state: state, serviceProvider: serviceProvider)
            return TasksMainPage(
                state: state,
                interceptor: interceptor
            ).asModule()
        }
    }
    
}
