//
//  ArtifactsRepository.swift
//  AcelanProgress
//
//  Created by Mikhail Yeremeyev on 20.05.2023.
//

import Foundation
import RealmSwift

@MainActor
final class ArtifactsRepository: RealmBasedRepository {
    
    func createArtifact(id: Int, fileType: String, remoteURL: String, filename: String, taskId: Int) async throws {
        try await withCheckedThrowingContinuation { continuation in
            let artifact = Artifact(id: id, fileType: fileType, remoteURL: remoteURL, filename: filename, taskId: taskId)
            
            do {
                try update { realm in
                    realm.add(artifact, update: .all)
                }
                continuation.resume()
            } catch let error {
                continuation.resume(throwing: error)
            }
        }
    }
    
    func getArtifact(id: Int) async throws -> Artifact? {
        try await withCheckedThrowingContinuation { continuation in
            do {
                let artifact = try getObject(ofType: Artifact.self, primaryKey: id)
                continuation.resume(returning: artifact)
            } catch let error {
                continuation.resume(throwing: error)
            }
        }
    }
    
    func getArtifacts() async throws -> Results<Artifact> {
        try await withCheckedThrowingContinuation { continuation in
            do {
                let artifacts = try getResults(ofType: Artifact.self)
                continuation.resume(returning: artifacts)
            } catch let error {
                continuation.resume(throwing: error)
            }
        }
    }
    
    func deleteArtifact(id: Int) async throws {
        try await withCheckedThrowingContinuation { continuation in
            do {
                if let artifact = try getObject(ofType: Artifact.self, primaryKey: id) {
                    if let modelFileURL = artifact.filename.documentFileURL {
                        try FileManager.default.removeItem(at: modelFileURL)
                    }
                    
                    try update { realm in
                        realm.delete(artifact)
                    }
                }
                continuation.resume()
            } catch let error {
                continuation.resume(throwing: error)
            }
        }
    }
    
    func deleteAllArtifacts() async throws {
        try await withCheckedThrowingContinuation { continuation in
            do {
                let results = try getResults(ofType: Artifact.self)
                
                for artifact in results {
                    if let modelFileURL = artifact.filename.documentFileURL {
                        try FileManager.default.removeItem(at: modelFileURL)
                    }
                }
                
                try update { realm in
                    realm.delete(results)
                }
                continuation.resume()
            } catch let error {
                continuation.resume(throwing: error)
            }
        }
    }
    
}
