//
//  Artifact.swift
//  AcelanProgress
//
//  Created by Mikhail Yeremeyev on 20.05.2023.
//

import Foundation
import RealmSwift

final class Artifact: Object {
    
    @Persisted(primaryKey: true)
    var id: Int = .zero
    
    @Persisted
    var fileType: String = .empty
    
    @Persisted
    var remoteURL: String = .empty
    
    @Persisted
    var filename: String = .empty
    
    @Persisted
    var taskId: Int = .zero
    
    convenience init(id: Int, fileType: String, remoteURL: String, filename: String, taskId: Int) {
        self.init()

        self.id = id
        self.fileType = fileType
        self.remoteURL = remoteURL
        self.filename = filename
        self.taskId = taskId
    }
    
}
