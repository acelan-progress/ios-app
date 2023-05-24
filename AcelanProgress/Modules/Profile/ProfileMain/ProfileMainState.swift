//
//  ProfileMainState.swift
//  AcelanProgress
//
//  Created by Mikhail Yeremeyev on 23.04.2023.
//

import Foundation
import Combine

final class ProfileMainState: ObservableObject {
    
    @Published
    var email: String = .dash
    
    @Published
    var loading = false
    
}
