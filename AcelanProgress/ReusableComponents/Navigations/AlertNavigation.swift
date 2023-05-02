//
//  AlertNavigation.swift
//  AcelanProgress
//
//  Created by Mikhail Yeremeyev on 01.05.2023.
//

import Foundation
import StatefulArch
import UIKit

protocol AlertItem {
    
    var title: String { get }
    var style: UIAlertAction.Style { get }
    
}

final class AlertNavigation<Item: AlertItem>: Navigation {

    let title: String?
    let message: String?
    let style: UIAlertController.Style
    let items: [Item]
    let onComplete: (Item) -> Void
    
    init(title: String?,
         message: String?,
         style: UIAlertController.Style,
         items: [Item],
         onComplete: @escaping (Item) -> Void) {
        self.title = title
        self.message = message
        self.style = style
        self.items = items
        self.onComplete = onComplete
    }
    
    func navigate(module: Module?, in rootViewController: RootViewController, animated: Bool) {
        let alertController = UIAlertController(title: title,
                                                message: message,
                                                preferredStyle: style)
        for item in items {
            let alertAction = UIAlertAction(title: item.title,
                                            style: item.style) { [weak self] _ in
                self?.onComplete(item)
            }
            alertController.addAction(alertAction)
        }
        
        rootViewController.getVisibleViewController().present(alertController,
                                                              animated: animated,
                                                              completion: nil)
    }
    
}

final class AlertNavigator<Item: AlertItem> {
    
    var navigation: AlertNavigation<Item>!
    var continuation: CheckedContinuation<Item, Never>!
    
    init(title: String?,
         message: String?,
         style: UIAlertController.Style,
         items: [Item]) {
        navigation = AlertNavigation(title: title,
                                     message: message,
                                     style: style,
                                     items: items) { [weak self] item in
            self?.onCompleteWithItem(item)
        }
    }
    
    func extractResult() async -> Item {
        return await withCheckedContinuation { continuation in
            DispatchQueue.main.async { [weak self] in
                guard let self else {
                    return
                }
                self.continuation = continuation
                NavigationService.use(navigation: self.navigation,
                                      with: nil,
                                      animated: true)
            }
        }
    }
    
    private func onCompleteWithItem(_ item: Item) {
        continuation.resume(returning: item)
    }
    
}

extension NavigationService {
    
    @discardableResult
    static func presentAlert<Item: AlertItem>(title: String? = nil,
                                              message: String? = nil,
                                              style: UIAlertController.Style = .alert,
                                              items: [Item]) async -> Item {
        let navigator = AlertNavigator(title: title,
                                       message: message,
                                       style: style,
                                       items: items)
        return await navigator.extractResult()
    }
    
}
