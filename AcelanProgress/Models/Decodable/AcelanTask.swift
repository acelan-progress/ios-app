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
    let status: String
    let started_at: String?
    let finished_at: String?
    let artifacts: [AcelanTaskArtifact]?
    
    var acelanTaskStatus: AcelanTaskStatus {
        AcelanTaskStatus(rawValue: status) ?? .unknown
    }
    
    var startedAtDate: Date? {
        if let started_at {
            return started_at.toDate(.default)
        }
        return nil
    }
    
    var finishedAtDate: Date? {
        if let finished_at {
            return finished_at.toDate(.default)
        }
        return nil
    }
    
    var supportedArtifact: AcelanTaskArtifact? {
        artifacts?.filter { $0.fileType == AcelanTaskFileType.ply }.first
    }

}
