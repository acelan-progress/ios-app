//
//  String+Date.swift
//  AcelanProgress
//
//  Created by Mikhail Yeremeyev on 02.05.2023.
//

import Foundation

extension String {
    
    func toDate(_ format: DateFormat) -> Date? {
        toDate(format.rawValue)
    }
    
    func toDate(_ format: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        dateFormatter.locale = Locale(identifier: "en_US")
        return dateFormatter.date(from: self)
    }
    
    enum DateFormat: String {
        
        case `default` = "yyyy-MM-dd'T'HH:mm:ss.SSSSSSZ"
        
    }
    
}
