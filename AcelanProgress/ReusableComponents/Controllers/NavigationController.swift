//
//  NavigationController.swift
//  AcelanProgress
//
//  Created by Mikhail Yeremeyev on 23.04.2023.
//

import Foundation
import UIKit
import StatefulArch

final class NavigationController: UINavigationController, UIGestureRecognizerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .resource(.White)
        
        interactivePopGestureRecognizer?.delegate = self
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        super.pushViewController(viewController, animated: animated)
        
        setNavigationBarHidden(true, animated: animated)
    }
    
    override func setNavigationBarHidden(_ hidden: Bool, animated: Bool) {
        super.setNavigationBarHidden(true, animated: animated)
    }
    
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        gestureRecognizer == interactivePopGestureRecognizer
    }
    
}

extension PageView where Interceptor: BasePageInterceptor {
    
    func asNavigationModule() -> Module {
        NavigationController(rootViewController: asModule())
    }
    
}
