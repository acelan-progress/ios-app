//
//  MainModuleBuilder.swift
//  AcelanProgress
//
//  Created by Mikhail Yeremeyev on 23.04.2023.
//

import Foundation
import StatefulArch

enum MainModuleBuilder: ModuleBuilder {
    
    case tabBar
    
    func buildModule(serviceProvider: ServiceProvider) -> ModuleConvertible {
        switch self {
        case .tabBar:
            return TabBarController(serviceProvider: serviceProvider)
        }
    }
    
}
