//
//  PageView+Module.swift
//  AcelanProgress
//
//  Created by Mikhail Yeremeyev on 28.04.2023.
//

import Foundation
import StatefulArch

extension PageView where Interceptor: BasePageInterceptor {
    
    func asModule(hidesBottomBarWhenPushed: Bool) -> Module {
        let module = asModule()
        module.hidesBottomBarWhenPushed = hidesBottomBarWhenPushed
        return module
    }
    
}
