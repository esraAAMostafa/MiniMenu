//
//  Tags.swift
//  MiniMenu
//
//  Created by Esraa on 10/30/19.
//  Copyright © 2019 task. All rights reserved.
//

import Foundation

struct TagsResponse: Codable {
    let tags: [TagResponse]
    
    init() {
        self.tags = [TagResponse()]
    }
}

struct TagResponse: Codable {
    let tagName: String
    let photoURL: String
    
    init() {
        self.tagName = ""
        self.photoURL = ""
    }
}
