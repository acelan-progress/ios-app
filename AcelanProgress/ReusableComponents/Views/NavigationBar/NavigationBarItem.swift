//
//  NavigationBarItem.swift
//  AcelanProgress
//
//  Created by Mikhail Yeremeyev on 25.04.2023.
//

import Foundation
import SwiftUI

enum NavigationBarItem {

    case backButton(action: () -> Void)
    case deleteButton(action: () -> Void)
    
}
