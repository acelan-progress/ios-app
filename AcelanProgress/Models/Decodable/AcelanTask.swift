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
    let started_at: Date?
    let finished_at: Date?
    let artifacts: [AcelanTaskArtifact]?
    
}
