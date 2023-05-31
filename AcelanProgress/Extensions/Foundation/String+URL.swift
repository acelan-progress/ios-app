//
//  String+URL.swift
//  AcelanProgress
//
//  Created by Mikhail Yeremeyev on 24.05.2023.
//

import Foundation

extension String {
    
    var localDocumentFileURL: URL? {
        guard let documentsDirectoryURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {
            return nil
        }
        return documentsDirectoryURL.appendingPathComponent(self)
    }
    
}
