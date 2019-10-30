//
//  Items.swift
//  MiniMenu
//
//  Created by Esraa on 10/30/19.
//  Copyright © 2019 task. All rights reserved.
//

import Foundation

class Items: Codable {
    let items: [Item]

    init(items: [Item]) {
        self.items = items
    }
}

class Item: Codable {
    let id: Int
    let name: String
    let photoURL: String
    let itemDescription: String

    enum CodingKeys: String, CodingKey {
        case id, name
        case photoURL = "photoUrl"
        case itemDescription = "description"
    }

    init(id: Int, name: String, photoURL: String, itemDescription: String) {
        self.id = id
        self.name = name
        self.photoURL = photoURL
        self.itemDescription = itemDescription
    }
}
