//
//  ImageResource.swift
//  AcelanProgress
//
//  Created by Mikhail Yeremeyev on 22.04.2023.
//

import Foundation
import SwiftUI

enum ImageResource: String {
    
    case icon_materials
    case icon_notifications
    case icon_prodile
    case icon_tasks
    
}

extension Image {
    
    static func resource(_ imageResource: ImageResource) -> Image {
        Image(imageResource.rawValue)
    }
    
    static func resourceTemplate(_ imageResource: ImageResource) -> Image {
        resource(imageResource).renderingMode(.template)
    }
    
}
