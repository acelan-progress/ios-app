//
//  LoginMainState.swift
//  AcelanProgress
//
//  Created by Mikhail Yeremeyev on 22.04.2023.
//

import Foundation
import SwiftUI
import StatefulArch

final class LoginMainState: ObservableObject {
    
    @Published
    var email: String = .empty
    
    @Published
    var password: String = .empty
    
    @Published
    var loading: Bool = false
    
}
