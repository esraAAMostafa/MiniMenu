//
//  EndPoint.swift
//  MiniMenu
//
//  Created by Esraa on 10/30/19.
//  Copyright © 2019 task. All rights reserved.
//

import Foundation

let baseURl = "https://elmenus-assignment.getsandbox.com"

protocol EndPoint {
    var url: URL {get set}
    var method: String {get set}
}
