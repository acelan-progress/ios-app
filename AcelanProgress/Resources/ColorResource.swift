//
//  ColorResource.swift
//  AcelanProgress
//
//  Created by Mikhail Yeremeyev on 22.04.2023.
//

import Foundation
import UIKit
import SwiftUI

enum ColorResource: String {
    
    case Black
    case Blue
    case Carbon
    case Green
    case LightGray
    case Orange
    case Purple
    case Red
    case White
    
}

extension UIColor {
    
    static func resource(_ colorResource: ColorResource) -> UIColor {
        UIColor(named: colorResource.rawValue)!
    }
    
}

extension Color {
    
    static func resource(_ colorResource: ColorResource) -> Color {
        Color(colorResource.rawValue)
    }
    
}
