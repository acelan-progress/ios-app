//
//  ErrorProcessor.swift
//  AcelanProgress
//
//  Created by Mikhail Yeremeyev on 01.05.2023.
//

import Foundation

@MainActor
protocol ErrorProcessor {
    
    func processError(record: ErrorRecord, from errorQueue: ErrorQueue) async
    
}

