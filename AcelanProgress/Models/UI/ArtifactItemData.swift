//
//  ArtifactItemData.swift
//  AcelanProgress
//
//  Created by Mikhail Yeremeyev on 29.04.2023.
//

import Foundation

protocol ArtifactItemData: Identifiable {
    
    var id: String { get }
    var fileType: String { get }
    var url: String { get }
    
}

#if DEBUG
enum ArtifactItemMock: String, CaseIterable, ArtifactItemData {
    
    case airplane
    case car
    
    var id: String {
        switch self {
        case .airplane:
            return 1.asString()
            
        case .car:
            return 2.asString()
        }
    }
    
    var fileType: String {
        switch self {
        case .airplane:
            return "ply"
            
        case .car:
            return "obj"
        }
    }
    
    var url: String {
        switch self {
        case .airplane:
            return "https://acelan.ru/artifacts/airplane.ply"
            
        case .car:
            return "https://acelan.ru/artifacts/car.obj"
        }
    }
    
}
#endif
