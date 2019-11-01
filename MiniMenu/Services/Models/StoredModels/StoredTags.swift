//
//  StoredTags.swift
//  MiniMenu
//
//  Created by Esraa on 10/31/19.
//  Copyright © 2019 task. All rights reserved.
//

import Foundation
import RealmSwift

@objcMembers class StoredTags: Object {
    var tags = RealmSwift.List<StoredTag>()

    func mapToTags() -> TagsList {
        var tags: TagsList = []
        self.tags.forEach {
            tags.append(Tag(tagName: $0.tagName, photoURL: $0.photoURL)) }
        return tags
    }
}

@objcMembers class StoredTag: Object {
    dynamic var tagName: String = ""
    dynamic var photoURL: String = ""

    override class func primaryKey() -> String? {
        return "tagName"
    }
}
