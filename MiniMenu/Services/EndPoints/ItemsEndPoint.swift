//
//  ItemsEndPoint.swift
//  MiniMenu
//
//  Created by Esraa on 10/30/19.
//  Copyright © 2019 task. All rights reserved.
//

import Foundation

class ItemsEndPoint: EndPoint {
    var url: String
    var method: HttpRequestMethod = .get
    
    init(tagName: String) {
        url = baseURl + "/items/\(tagName)"
    }
}
