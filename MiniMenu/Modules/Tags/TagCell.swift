//
//  TagCell.swift
//  MiniMenu
//
//  Created by Esraa on 11/1/19.
//  Copyright © 2019 task. All rights reserved.
//

import UIKit

class TagCell: UICollectionViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var image: UIImageView!
    
    func config(tag: Tag) {
        nameLabel.text = tag.name.substring(after: 4)
        image.setImage(imageUrl: tag.photoURL)
    }
}
