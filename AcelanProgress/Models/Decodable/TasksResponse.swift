//
//  TasksResponse.swift
//  AcelanProgress
//
//  Created by Mikhail Yeremeyev on 01.05.2023.
//

import Foundation

struct TasksResponse: Decodable {
    
    let tasks: [AcelanTask]
    
}
