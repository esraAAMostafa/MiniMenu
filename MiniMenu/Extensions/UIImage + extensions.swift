//
//  UIImage + extensions.swift
//  MiniMenu
//
//  Created by Esraa on 11/1/19.
//  Copyright © 2019 task. All rights reserved.
//

import UIKit
import Kingfisher

extension UIImageView {
    func setImage(imageUrl: String?) {
        if let imageUrl = imageUrl, imageUrl != "" {
            self.kf.setImage(with: URL(string: imageUrl), placeholder: #imageLiteral(resourceName: "mealPlaceHolder"))
            return
        }
        self.image = #imageLiteral(resourceName: "mealPlaceHolder")
    }

}
