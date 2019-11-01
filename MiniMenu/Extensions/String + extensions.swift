//
//  String + extensions.swift
//  MiniMenu
//
//  Created by Esraa on 11/1/19.
//  Copyright © 2019 task. All rights reserved.
//

import Foundation

extension String {
    func substring(after index: Int) -> String {
        return String(self.suffix(from: self.index(self.startIndex, offsetBy: index)))
    }
}
