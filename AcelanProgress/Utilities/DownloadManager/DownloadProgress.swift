//
//  DownloadProgress.swift
//  AcelanProgress
//
//  Created by Mikhail Yeremeyev on 16.05.2023.
//

import Foundation
import Combine

final class DownloadProgress: ObservableObject {
    
    private var cancellables = Set<AnyCancellable>()
    
    @Published
    var totalBytesWritten: Int64 = .zero
    
    @Published
    var totalBytesExpectedToWrite: Int64 = .zero
    
    @Published
    var progress: Double = .zero
    
    deinit {
        cancellables.forEach {
            $0.cancel()
        }
    }
    
    func updateWith(totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
        self.totalBytesWritten = totalBytesWritten
        self.totalBytesExpectedToWrite = totalBytesExpectedToWrite
        self.progress = Double(totalBytesWritten) / Double(totalBytesExpectedToWrite)
    }
    
    func subscribe(onProgressChanged: @escaping (Double) -> Void) {
        $progress.removeDuplicates()
            .sink {
                onProgressChanged($0)
            }
            .store(in: &cancellables)
    }
    
}

