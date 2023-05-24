//
//  URLSession.swift
//  AcelanProgress
//
//  Created by Mikhail Yeremeyev on 23.05.2023.
//

import Foundation

extension URLSession {
    
    func download(from sourceURL: URL, to destinationURL: URL) async throws -> HTTPURLResponse {
        try await withCheckedThrowingContinuation { continuation in
            let task = downloadTask(with: sourceURL) { temporaryURL, response, error in
                if let error {
                    continuation.resume(throwing: error)
                    return
                }
                
                if let temporaryURL {
                    do {
                        if FileManager.default.fileExists(atPath: destinationURL.path) {
                            try FileManager.default.removeItem(at: destinationURL)
                        }
                        try FileManager.default.moveItem(at: temporaryURL, to: destinationURL)
                    } catch let fileManagerError {
                        continuation.resume(throwing: fileManagerError)
                        return
                    }
                }
                
                if let httpResponse = response as? HTTPURLResponse {
                    continuation.resume(returning: httpResponse)
                    return
                }
                
                continuation.resume(throwing: URLError(.badServerResponse))
            }
            
            task.resume()
        }
    }
    
}
