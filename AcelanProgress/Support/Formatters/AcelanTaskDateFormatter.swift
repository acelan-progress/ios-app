//
//  AcelanTaskDateFormatter.swift
//  AcelanProgress
//
//  Created by Mikhail Yeremeyev on 23.04.2023.
//

import Foundation

class AcelanTaskDateFormatter: DateFormatterProtocol {
    
    static func format(_ date: Date) -> String {
        dateFormatter.string(from: date)
    }
    
    private static var dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.setLocalizedDateFormatFromTemplate("dd.MM.yyyy, hh:mm")
        return dateFormatter
    }()
    
}
