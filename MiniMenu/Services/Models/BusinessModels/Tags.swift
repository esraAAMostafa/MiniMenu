//
//  Tags.swift
//  MiniMenu
//
//  Created by Esraa on 11/1/19.
//  Copyright © 2019 task. All rights reserved.
//

import Foundation

typealias TagsList = [Tag]

class Tag {
    let tagName: String
    let photoURL: String

    init(tagName: String, photoURL: String) {
        self.tagName = tagName
        self.photoURL = photoURL
    }
}
