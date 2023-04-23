//
//  ProfileMainScenario.swift
//  AcelanProgress
//
//  Created by Mikhail Yeremeyev on 23.04.2023.
//

import Foundation
import StatefulArch

final class ProfileMainScenario: PageScenario {
    
    @Published
    var loading: Bool = false
    
}

extension ProfileMainScenario: ProfileMainScenarioProtocol {
    
    func performLogout() async {
        loading = true
        // TODO: - Implement API request
        try? await Task.sleep(nanoseconds: 1_000_000_000)
        loading = false
    }
    
    func bindFrom(loadingPublisher: inout Published<Bool>.Publisher) {
        $loading.assign(to: &loadingPublisher)
    }
    
}
