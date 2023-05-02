//
//  AppErrorProcessor.swift
//  AcelanProgress
//
//  Created by Mikhail Yeremeyev on 01.05.2023.
//

import Foundation
import UIKit
import StatefulArch

enum AppErrorProcessorAlertItem: AlertItem, CaseIterable {
    
    case ok
        
    var title: String {
        switch self {
        case .ok:
            return "Ok"
        }
    }
    
    var style: UIAlertAction.Style {
        switch self {
        case .ok:
            return .default
        }
    }
    
}

@MainActor
final class AppErrorProcessor: ErrorProcessor {
    
    func processError(record: ErrorRecord, from errorQueue: ErrorQueue) async {
        switch record.error {
        case let urlError as URLError where urlError.code == .notConnectedToInternet:
            await showError(
                title: nil,
                message: .internetUnavailable
            )
            
        case let decodingError as DecodingError:
            #if DEBUG
            print("\(Self.self) internal error:\n\(decodingError.description)")
            #endif
            
            await showError(
                title: nil,
                message: .internalError
            )
            
        case let presentableError as LocalizedError:
            let message = presentableError.errorDescription?.nilIfEmpty ?? presentableError.localizedDescription
            
            await showError(
                title: nil,
                message: message
            )
            
        default:
            #if DEBUG
            print("\(Self.self) can`t process error \(record.error) in", #function)
            #endif
        }
        
        errorQueue.processingComplete(for: record)
    }
        
    private func showError(title: String?, message: String?) async {
        await NavigationService.presentAlert(
            title: title,
            message: message,
            style: .alert,
            items: AppErrorProcessorAlertItem.allCases
        )
    }
    
}
