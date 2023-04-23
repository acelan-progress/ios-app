//
//  TabBarItem.swift
//  AcelanProgress
//
//  Created by Mikhail Yeremeyev on 23.04.2023.
//

import Foundation
import UIKit

enum TabBarItem {
    
    case tasks
    case artifacts
    case notifications
    case profile
    
    var title: String {
        switch self {
        case .tasks:
            return "Tasks"
            
        case .artifacts:
            return "Artifacts"
            
        case .notifications:
            return "Notifications"
            
        case .profile:
            return "Profile"
        }
    }
    
    var icon: UIImage {
        switch self {
        case .tasks:
            return .resource(.icon_tasks)
            
        case .artifacts:
            return .resource(.icon_artifacts)
            
        case .notifications:
            return .resource(.icon_notifications)
            
        case .profile:
            return .resource(.icon_profile)
        }
    }
    
}
