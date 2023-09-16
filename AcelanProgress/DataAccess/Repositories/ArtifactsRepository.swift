//
//  ArtifactsRepository.swift
//  AcelanProgress
//
//  Created by Mikhail Yeremeyev on 20.05.2023.
//

import Foundation
import RealmSwift

final class ArtifactsRepository: RealmBasedRepository {
    
    func createArtifact(id: Int,
                        fileType: String,
                        remoteURL: String,
                        filename: String,
                        taskId: Int) async {
        let artifact = RealmArtifact(id: id,
                                     fileType: fileType,
                                     remoteURL: remoteURL,
                                     filename: filename,
                                     taskId: taskId)
        await write { realm in
            realm.add(artifact)
        }
    }
    
    func getArtifact(id: Int) async -> AcelanTaskArtifact? {
        if let realmArtifact: RealmArtifact = await object(forPrimaryKey: id) {
            return realmArtifact.toAcelanTaskArtifact()
        } else {
            return nil
        }
    }
    
    func getArtifacts() async -> [AcelanTaskArtifact] {
        if let realmArtifacts: Results<RealmArtifact> = await objects() {
            return realmArtifacts.map { $0.toAcelanTaskArtifact() }
        } else {
            return []
        }
    }
    
    func deleteArtifact(id: Int) async {
        if let artifact: RealmArtifact = await object(forPrimaryKey: id) {
            if let modelFileURL = artifact.filename.localDocumentFileURL, FileManager.default.fileExists(atPath: modelFileURL.path) {
                try? FileManager.default.removeItem(at: modelFileURL)
            }
            
            await write { realm in
                realm.delete(artifact)
            }
        }
    }
    
    func deleteAllArtifacts() async {
        guard let results: Results<RealmArtifact> = await objects() else {
            return
        }
        
        for artifact in results {
            if let modelFileURL = artifact.filename.localDocumentFileURL, FileManager.default.fileExists(atPath: modelFileURL.path) {
                try? FileManager.default.removeItem(at: modelFileURL)
            }
        }
        
        await write { realm in
            realm.delete(results)
        }
    }
    
}
