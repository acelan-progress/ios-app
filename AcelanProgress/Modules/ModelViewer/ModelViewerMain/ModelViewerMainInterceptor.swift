//
//  ModelViewerMainInterceptor.swift
//  AcelanProgress
//
//  Created by Mikhail Yeremeyev on 01.05.2023.
//

import Foundation
import StatefulArch

final class ModelViewerMainInterceptor: PageInterceptor<ModelViewerMainAction, ModelViewerMainState> {
    
    override func handle(action: ModelViewerMainAction) async {
        switch action {
        case .goBack:
            NavigationService.pop()
            
        case .deleteModel:
            // TODO: - implement model deletion
            break
        }
    }
    
}
