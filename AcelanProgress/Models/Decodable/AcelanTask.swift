//
//  AcelanTask.swift
//  AcelanProgress
//
//  Created by Mikhail Yeremeyev on 23.04.2023.
//

import Foundation

struct AcelanTask: Decodable {
    
    let id: Int
    let name: String
    let status: AcelanTaskStatus
    let startedAt: Date?
    let finishedAt: Date?
    let artifacts: [AcelanTaskArtifact]?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case status
        case startedAt = "started_at"
        case finishedAt = "finished_at"
        case artifacts
    }
    
}
