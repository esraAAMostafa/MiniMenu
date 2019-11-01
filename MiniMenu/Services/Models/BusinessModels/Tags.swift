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
    let name: String
    let photoURL: String

    init(name: String, photoURL: String) {
        self.name = name
        self.photoURL = photoURL
    }
}
