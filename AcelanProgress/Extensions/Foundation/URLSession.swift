//
//  URLSession.swift
//  AcelanProgress
//
//  Created by Mikhail Yeremeyev on 23.05.2023.
//

import Foundation

extension URLSession {
    
    func download(from remoteURL: URL, to localURL: URL) async throws -> HTTPURLResponse {
        try await withCheckedThrowingContinuation { continuation in
            let task = downloadTask(with: remoteURL) { temporaryLocalURL, response, error in
                if let error {
                    continuation.resume(throwing: error)
                    return
                }
                
                if let temporaryLocalURL {
                    do {
                        if FileManager.default.fileExists(atPath: localURL.path) {
                            try FileManager.default.removeItem(at: localURL)
                        }
                        try FileManager.default.moveItem(at: temporaryLocalURL, to: localURL)
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
