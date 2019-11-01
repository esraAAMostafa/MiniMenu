//
//  Items.swift
//  MiniMenu
//
//  Created by Esraa on 10/30/19.
//  Copyright © 2019 task. All rights reserved.
//

import Foundation

struct ItemsResponse: Codable {
    let items: [ItemResponse]
    
    init() {
        self.items = [ItemResponse()]
    }
    
    func mapToItems() -> ItemsList {
        var items: ItemsList = []
        self.items.forEach {
            items.append(Item(id: $0.id, name: $0.name, photoURL: $0.photoURL,
                              itemDescription: $0.itemDescription)) }
        return items
    }
}

struct ItemResponse: Codable {
    let id: Int
    let name: String
    let photoURL: String
    let itemDescription: String

    enum CodingKeys: String, CodingKey {
        case id, name
        case photoURL = "photoUrl"
        case itemDescription = "description"
    }
    
    init() {
        self.id = 0
        self.name = ""
        self.photoURL = ""
        self.itemDescription = ""
    }
}
