//
//  StoredTags.swift
//  MiniMenu
//
//  Created by Esraa on 10/31/19.
//  Copyright © 2019 task. All rights reserved.
//

import Foundation
import Realm
import RealmSwift   

@objcMembers class StoredTags: Object, Decodable {

    var tags = RealmSwift.List<StoredTag>()
    
    enum CodingKeys: String, CodingKey {
        case tags
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        tags.append(objectsIn: try container.decode([StoredTag].self, forKey: .tags))
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

@objcMembers class StoredTag: Object, Decodable {
    dynamic var tagName: String = ""
    dynamic var photoURL: String = ""
    
    enum CodingKeys: String, CodingKey {
        case tagName
        case photoURL
    }

    override class func primaryKey() -> String? {
        return "tagName"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        tagName = try container.decode(String.self, forKey: .tagName)
        photoURL = try container.decode(String.self, forKey: .photoURL)
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
