//
//  StoredTags.swift
//  MiniMenu
//
//  Created by Esraa on 10/31/19.
//  Copyright © 2019 task. All rights reserved.
//

import Foundation
import RealmSwift

@objcMembers class StoredTag: Object {

    dynamic var tagName: String = ""
    dynamic var photoURL: String = ""
    
    override class func primaryKey() -> String? {
        return "tagName"
    }
    
    convenience init(tag: Tag) {
        self.init()
        self.tagName = tag.name
        self.photoURL = tag.photoURL
    }
    
    func toModel() -> Tag {
        return Tag(name: tagName, photoURL: photoURL)
    }
}
