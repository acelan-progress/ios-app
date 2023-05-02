//
//  ErrorRecord.swift
//  AcelanProgress
//
//  Created by Mikhail Yeremeyev on 01.05.2023.
//

import Foundation

struct ErrorRecord: Equatable {
    
    let date: Date
    let error: Error
    
    static func ==(lhs: ErrorRecord, rhs: ErrorRecord) -> Bool {
        lhs.date == rhs.date
    }
    
}
