//
//  ImageResource.swift
//  AcelanProgress
//
//  Created by Mikhail Yeremeyev on 22.04.2023.
//

import Foundation
import UIKit
import SwiftUI

enum ImageResource: String {
    
    case icon_materials
    case icon_notifications
    case icon_prodile
    case icon_tasks
    case image_acelan_logo
    
}

extension UIImage {
    
    static func resource(_ imageResource: ImageResource) -> UIImage {
        UIImage(named: imageResource.rawValue)!
    }
    
    static func resourceTemplate(_ imageResource: ImageResource) -> UIImage {
        resource(imageResource).withRenderingMode(.alwaysTemplate)
    }
    
}

extension Image {
    
    static func resource(_ imageResource: ImageResource) -> Image {
        Image(imageResource.rawValue)
    }
    
    static func resourceTemplate(_ imageResource: ImageResource) -> Image {
        resource(imageResource).renderingMode(.template)
    }
    
}
