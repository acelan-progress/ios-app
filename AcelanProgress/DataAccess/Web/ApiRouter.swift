//
//  ApiRouter.swift
//  AcelanProgress
//
//  Created by Mikhail Yeremeyev on 01.05.2023.
//

import Foundation

enum ApiRouter {
    
    case token
    case tasks
    case task(taskId: Int)
    
    var path: String {
        switch self {
        case .token:
            return "/token"
            
        case .tasks:
            return "/tasks"
            
        case let .task(taskId: taskId):
            return "/tasks/\(taskId)"
        }
    }
    
    func asURL() -> URL {
        var url = URL(string: ApiConstants.apiUrlString)!
        url.appendPathComponent(path)
        return url
    }
    
}
