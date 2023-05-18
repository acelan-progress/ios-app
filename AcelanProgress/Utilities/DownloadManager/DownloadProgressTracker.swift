//
//  DownloadProgressTracker.swift
//  AcelanProgress
//
//  Created by Mikhail Yeremeyev on 18.05.2023.
//

import Foundation

final class DownloadProgressTracker: NSObject, URLSessionDownloadDelegate {
    
    private let downloadProgress: DownloadProgress
    
    init(onProgressChanged: @escaping (Double) -> Void) {
        let downloadProgress = DownloadProgress()
        downloadProgress.subscribe(onProgressChanged: onProgressChanged)
        self.downloadProgress = downloadProgress
        
        super.init()
    }
    
    func urlSession(_ session: URLSession,
                    downloadTask: URLSessionDownloadTask,
                    didFinishDownloadingTo location: URL) {
    }
    
    func urlSession(_ session: URLSession,
                    downloadTask: URLSessionDownloadTask,
                    didWriteData bytesWritten: Int64,
                    totalBytesWritten: Int64,
                    totalBytesExpectedToWrite: Int64) {
        downloadProgress.updateWith(totalBytesWritten: totalBytesWritten,
                                    totalBytesExpectedToWrite: totalBytesExpectedToWrite)
    }
    
}
