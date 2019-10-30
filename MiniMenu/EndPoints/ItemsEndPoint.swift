//
//  ItemsEndPoint.swift
//  MiniMenu
//
//  Created by Esraa on 10/30/19.
//  Copyright © 2019 task. All rights reserved.
//

import Foundation

class ItemsEndPoint: EndPoint {
    var url: URL
    var method: String = "get"
    
    init(tagName: String) {
        url = URL(string: baseURl + "/items/\(tagName)")!
    }
}
