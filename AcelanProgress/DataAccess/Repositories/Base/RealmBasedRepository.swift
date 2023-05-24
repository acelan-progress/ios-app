//
//  RealmBasedRepository.swift
//  AcelanProgress
//
//  Created by Mikhail Yeremeyev on 24.05.2023.
//

import Foundation
import RealmSwift

class RealmBasedRepository {
    
    private let executionQueue = DispatchQueue(
        label: "ru.mmcs.sfedu.AcelanProgress.RealmBasedRepository",
        qos: .userInitiated,
        attributes: .concurrent
    )
    
    private let mutex = NSLock()
    
    private var realm: Realm!
    
    func requestRealm() throws -> Realm {
        defer {
            mutex.unlock()
        }
        mutex.lock()
        
        if let realm {
            return realm
        }
        
        var error: Error?
        
        executionQueue.sync {
            do {
                realm = try Realm()
            } catch let realmError {
                error = realmError
            }
        }
        
        if let error {
            throw error
        }
        
        return realm
    }
    
    func getResults<O: Object>(ofType objectType: O.Type) throws -> Results<O> {
        let realm = try requestRealm()
        return realm.objects(objectType)
    }
    
    func getObject<O: Object, K>(ofType objectType: O.Type, primaryKey: K) throws -> O? {
        let realm = try requestRealm()
        return realm.object(ofType: objectType, forPrimaryKey: primaryKey)
    }
    
    func update(_ updateAction: @escaping (Realm) -> Void) throws {
        let realm = try requestRealm()
        
        var error: Error?
        
        executionQueue.sync {
            do {
                try realm.write {
                    updateAction(realm)
                }
            } catch let realmError {
                error = realmError
            }
        }
        
        if let error {
            throw error
        }
    }
    
}
