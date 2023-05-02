//
//  ErrorProcessorConfiguration.swift
//  AcelanProgress
//
//  Created by Mikhail Yeremeyev on 01.05.2023.
//

import Foundation
import AppConfiguration

final class ErrorProcessorConfiguration: AppConfigurationModule {
    
    static func setup() {
        let errorProcessor = AppErrorProcessor()
        ErrorQueue.shared.bindErrorProcessor(errorProcessor)
    }
    
}
