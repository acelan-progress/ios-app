//
//  RealmBasedRepository.swift
//  AcelanProgress
//
//  Created by Mikhail Yeremeyev on 20.08.2023.
//

import Foundation
import RealmSwift

@MainActor
class RealmBasedRepository {
    
    private var realm: Realm? {
        get async {
            try? await Realm()
        }
    }
    
    func write(action: @escaping (Realm) -> Void) async {
        guard let realm = await realm else {
            return
        }
        
        try? realm.write {
            action(realm)
        }
    }
    
    func object<O: Object, KeyType>(forPrimaryKey: KeyType) async -> O? {
        guard let realm = await realm else {
            return nil
        }
        
        return realm.object(ofType: O.self, forPrimaryKey: forPrimaryKey)
    }
    
    func objects<O: Object>() async -> Results<O>? {
        guard let realm = await realm else {
            return nil
        }
        
        return realm.objects(O.self)
    }
    
}
