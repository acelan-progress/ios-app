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
    case Carbon
    case DarkBlue
    case DarkGray
    case DarkGreen
    case DarkRed
    case LightBlue
    case LightGray
    case LightGreen
    case Pink
    case Purple
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
