//
//  ErrorHandler.swift
//  AcelanProgress
//
//  Created by Mikhail Yeremeyev on 01.05.2023.
//

import Foundation

protocol ErrorHandler {
    
    var errorQueue: ErrorQueue { get }
    
}

extension ErrorHandler {
    
    var errorQueue: ErrorQueue {
        .shared
    }
    
    @discardableResult
    func handleError<Success>(in action: () async throws -> Success) async -> Result<Success, Error> {
        do {
            let result = try await action()
            return .success(result)
        } catch let error {
            errorQueue.enqueue(error: error)
            return .failure(error)
        }
    }
    
}

extension Result {
    
    var isSuccess: Bool {
        switch self {
        case .success:
            return true
            
        default:
            return false
        }
    }
    
    var value: Success? {
        try? get()
    }
    
}
