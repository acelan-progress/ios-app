//
//  ErrorQueue.swift
//  AcelanProgress
//
//  Created by Mikhail Yeremeyev on 01.05.2023.
//

import Foundation

final class ErrorQueue {
    
    private var errorRecords: [ErrorRecord] = []
    private var processingErrorRecord: ErrorRecord?
    
    private var errorProcessor: ErrorProcessor?
    
    static let shared = ErrorQueue()
    
    func bindErrorProcessor(_ errorProcessor: ErrorProcessor) {
        self.errorProcessor = errorProcessor
    }
    
    func enqueue(error: Error) {
        errorRecords.append(
            ErrorRecord(
                date: Date(),
                error: error
            )
        )
        
        throwNextErrorIfNeeded()
    }
    
    func processingComplete(for record: ErrorRecord) {
        if record == processingErrorRecord {
            if !errorRecords.isEmpty, errorRecords.first == processingErrorRecord {
                errorRecords.removeFirst()
                processingErrorRecord = nil
            }
            
            throwNextErrorIfNeeded()
        }
    }
    
    private func throwNextErrorIfNeeded() {
        if processingErrorRecord == nil {
            if let nextErrorRecord = errorRecords.first {
                processingErrorRecord = nextErrorRecord
                
                let errorQueue = self
                let errorProcessor = self.errorProcessor
                
                Task {
                    await errorProcessor?.processError(
                        record: nextErrorRecord,
                        from: errorQueue
                    )
                }
            }
        }
    }
    
}
