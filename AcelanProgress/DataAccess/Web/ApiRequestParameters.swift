//
//  ApiRequestParameters.swift
//  AcelanProgress
//
//  Created by Mikhail Yeremeyev on 01.05.2023.
//

import Foundation
import WebClient

extension RequestParameters {
    
    static func getTokenParameters(email: String, password: String) -> RequestParameters {
        let json = [
            "email": email,
            "password": password
        ]
        return RequestParameters(baseURL: ApiRouter.token.asURL(),
                                 method: .post,
                                 body: .json(json: RequestJSON(jsonObject: json)))
    }
    
    static func getTasksParameters() -> RequestParameters {
        RequestParameters(baseURL: ApiRouter.tasks.asURL())
    }
    
    static func getTaskParameters(taskId: Int) -> RequestParameters {
        RequestParameters(baseURL: ApiRouter.task(taskId: taskId).asURL())
    }
    
}
