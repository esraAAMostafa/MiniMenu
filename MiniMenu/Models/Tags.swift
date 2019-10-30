//
//  Tags.swift
//  MiniMenu
//
//  Created by Esraa on 10/30/19.
//  Copyright © 2019 task. All rights reserved.
//

import Foundation

class Tags: Codable {
    let tags: [Tag]

    init(tags: [Tag]) {
        self.tags = tags
    }
}

class Tag: Codable {
    let tagName: String
    let photoURL: String

    init(tagName: String, photoURL: String) {
        self.tagName = tagName
        self.photoURL = photoURL
    }
}
