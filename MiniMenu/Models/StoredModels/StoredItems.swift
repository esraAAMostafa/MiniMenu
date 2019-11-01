//
//  StoredItems.swift
//  MiniMenu
//
//  Created by Esraa on 11/1/19.
//  Copyright © 2019 task. All rights reserved.
//

import Foundation
import Realm
import RealmSwift

@objcMembers class StoredItems: Object, Decodable {

    var items = RealmSwift.List<StoredItem>()
    
    enum CodingKeys: String, CodingKey {
        case items
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        items.append(objectsIn: try container.decode([StoredItem].self, forKey: .items))
        super.init()
    }

    required init() {
        super.init()
    }
    
    required init(value: Any, schema: RLMSchema) {
        super.init(value: value, schema: schema)
    }
    
    required init(realm: RLMRealm, schema: RLMObjectSchema) {
        super.init(realm: realm, schema: schema)
    }
}

@objcMembers class StoredItem: Object, Decodable {
    
    dynamic var id: Int = 0
    dynamic var name: String = ""
    dynamic var photoURL: String = ""
    dynamic var itemDescription: String = ""

    enum CodingKeys: String, CodingKey {
        case id, name
        case photoURL = "photoUrl"
        case itemDescription = "description"
    }

    override class func primaryKey() -> String? {
        return "id"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        photoURL = try container.decode(String.self, forKey: .photoURL)
        itemDescription = try container.decode(String.self, forKey: .itemDescription)
        super.init()
    }

    required init() {
        super.init()
    }
    
    required init(value: Any, schema: RLMSchema) {
        super.init(value: value, schema: schema)
    }
    
    required init(realm: RLMRealm, schema: RLMObjectSchema) {
        super.init(realm: realm, schema: schema)
    }
}
