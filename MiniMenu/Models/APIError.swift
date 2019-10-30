//
//  APIError.swift
//  MiniMenu
//
//  Created by Esraa on 10/30/19.
//  Copyright © 2019 task. All rights reserved.
//

import Foundation

class APIError: Codable {
    let errors: [LocalError]

    init(errors: [LocalError]) {
        self.errors = errors
    }
}

class LocalError: Codable {
    let message: String
    
    init(message: String) {
        self.message = message
    }
}
