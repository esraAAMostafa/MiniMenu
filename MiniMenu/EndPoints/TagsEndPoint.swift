//
//  TagsEndPoint.swift
//  MiniMenu
//
//  Created by Esraa on 10/30/19.
//  Copyright © 2019 task. All rights reserved.
//

import Foundation

class TagsEndPoint: EndPoint {
    var url: URL
    var method: String = "get"
    
    init(page: Int) {
        url = URL(string: baseURl + "/tags/\(page)")!
        
    }
}
