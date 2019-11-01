//
//  TagsEndPoint.swift
//  MiniMenu
//
//  Created by Esraa on 10/30/19.
//  Copyright © 2019 task. All rights reserved.
//

import Foundation

class TagsEndPoint: EndPoint {
    var url: String
    var method: HttpRequestMethod = .get
    
    init(page: Int) {
        url = baseURl + "/tags/\(page)"
    }
}
