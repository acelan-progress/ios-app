//
//  DownloadManager.swift
//  AcelanProgress
//
//  Created by Mikhail Yeremeyev on 13.05.2023.
//

import Foundation

final class DownloadManager {
    
    private var session: URLSession
    
    init(session: URLSession) {
        self.session = session
    }
    
    func download(from url: URL, onProgressChanged: @escaping (Double) -> Void) async throws -> (URL, URLResponse) {
        let downloadProgressTracker = DownloadProgressTracker(onProgressChanged: onProgressChanged)
        return try await session.download(from: url, delegate: downloadProgressTracker)
    }
    
}
