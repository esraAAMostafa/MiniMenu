//
//  Items.swift
//  MiniMenu
//
//  Created by Esraa on 11/1/19.
//  Copyright © 2019 task. All rights reserved.
//

import Foundation

typealias ItemsList = [Item]

class Item: Codable {
    let id: Int
    let name: String
    let photoURL: String
    let itemDescription: String
    
    init(id: Int, name: String, photoURL: String, itemDescription: String) {
        self.id = id
        self.name = name
        self.photoURL = photoURL
        self.itemDescription = itemDescription
    }
}
