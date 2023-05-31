//
//  ArtifactsRepository.swift
//  AcelanProgress
//
//  Created by Mikhail Yeremeyev on 20.05.2023.
//

import Foundation
import RealmSwift

@MainActor
final class ArtifactsRepository {
    
    func createArtifact(id: Int, fileType: String, remoteURL: String, filename: String, taskId: Int) async throws {
        let realm = try await Realm()
        let artifact = Artifact(id: id, fileType: fileType, remoteURL: remoteURL, filename: filename, taskId: taskId)
        try realm.write {
            realm.add(artifact)
        }
    }
    
    func getArtifact(id: Int) async throws -> Artifact? {
        let realm = try await Realm()
        return realm.object(ofType: Artifact.self, forPrimaryKey: id)
    }
    
    func getArtifacts() async throws -> Results<Artifact> {
        let realm = try await Realm()
        return realm.objects(Artifact.self)
    }
    
    func deleteArtifact(id: Int) async throws {
        let realm = try await Realm()
        if let artifact = realm.object(ofType: Artifact.self, forPrimaryKey: id) {
            if let modelFileURL = artifact.filename.localDocumentFileURL {
                try FileManager.default.removeItem(at: modelFileURL)
            }
            try realm.write {
                realm.delete(artifact)
            }
        }
    }
    
    func deleteAllArtifacts() async throws {
        let realm = try await Realm()
        let results = realm.objects(Artifact.self)
        for artifact in results {
            if let modelFileURL = artifact.filename.localDocumentFileURL {
                try FileManager.default.removeItem(at: modelFileURL)
            }
        }
        try realm.write {
            realm.delete(results)
        }
    }
    
}
