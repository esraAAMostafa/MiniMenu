//
//  RealmService.swift
//  MiniMenu
//
//  Created by Esraa on 10/31/19.
//  Copyright © 2019 task. All rights reserved.
//

import Foundation
import RealmSwift

class RealmService {

    static var shared = RealmService()
    
    private var realm: Realm?

    init() {
        do { realm = try Realm() } catch { }
    }
    
    func appendObjects(_ objects: [Object]) {
        guard let realm = realm else { return }
        realm.beginWrite()
        objects.forEach({realm.add($0, update: .modified)})
        try? realm.commitWrite()
    }

    func get(type: Object.Type) -> [Object]? {
        guard let realm = realm else { return nil }
        return Array(realm.objects(type))
    }
}
