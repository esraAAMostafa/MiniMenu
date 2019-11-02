//
//  StoredItems.swift
//  MiniMenu
//
//  Created by Esraa on 11/1/19.
//  Copyright © 2019 task. All rights reserved.
//

import Foundation
import RealmSwift

@objcMembers class StoredItem: Object {
    
    dynamic var id: Int = 0
    dynamic var name: String = ""
    dynamic var tagName: String = ""
    dynamic var photoURL: String = ""
    dynamic var itemDescription: String = ""
    
    override class func primaryKey() -> String? {
        return "id"
    }

    convenience init(item: Item, tagName: String) {
        self.init()
        self.id = item.id
        self.name = item.name
        self.tagName = tagName
        self.photoURL = item.photoURL
        self.itemDescription = item.itemDescription
    }
    
    func toModel() -> Item {
        return Item(id: id, name: name, photoURL: photoURL, itemDescription: itemDescription)
    }
}
