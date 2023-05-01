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
    case detail
    
    func buildModule(serviceProvider: ServiceProvider) -> ModuleConvertible {
        switch self {
        case .main:
            let state = TasksMainState()
            let interceptor = TasksMainInterceptor(state: state, serviceProvider: serviceProvider)
            return TasksMainPage(
                state: state,
                interceptor: interceptor
            ).asNavigationModule()
        
        case .detail:
            let state = TasksDetailState()
            let interceptor = TasksDetailInterceptor(state: state, serviceProvider: serviceProvider)
            return TasksDetailPage(
                state: state,
                interceptor: interceptor
            ).asModule(hidesBottomBarWhenPushed: true)
        }
    }
    
}
