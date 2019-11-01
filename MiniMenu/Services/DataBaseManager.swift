//
//  DataBaseManager.swift
//  MiniMenu
//
//  Created by Esraa on 10/31/19.
//  Copyright © 2019 task. All rights reserved.
//

import Foundation
import RealmSwift

class DatabaseManager {

    private var database: Realm?
    static let sharedInstance = DatabaseManager()

    private init() {
        do {
            database = try Realm()
        }
        catch {
            print("Fail to initialize realm")
        }
    }

    func add(object: Object) {
        do {
            try database?.write {
                database?.add(object)
            }
        } catch {
            print("Fail to add Item")
        }
    }
    
    func getData(type: Object.Type) -> Results<Object> {
        let results = database!.objects(type)
        return results
    }
}
