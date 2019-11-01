//
//  StoredItems.swift
//  MiniMenu
//
//  Created by Esraa on 11/1/19.
//  Copyright © 2019 task. All rights reserved.
//

import Foundation
import RealmSwift

@objcMembers class StoredItems: Object {
    var items = RealmSwift.List<StoredItem>()
    
    func mapToItems() -> ItemsList {
        var items: ItemsList = []
        self.items.forEach {
            items.append(Item(id: $0.id, name: $0.name, photoURL: $0.photoURL,
                              itemDescription: $0.itemDescription)) }
        return items
    }
}

@objcMembers class StoredItem: Object {

    dynamic var id: Int = 0
    dynamic var name: String = ""
    dynamic var photoURL: String = ""
    dynamic var itemDescription: String = ""

    override class func primaryKey() -> String? {
        return "id"
    }
}
