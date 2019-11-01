//
//  ItemCell.swift
//  MiniMenu
//
//  Created by Esraa on 11/1/19.
//  Copyright © 2019 task. All rights reserved.
//

import UIKit

class ItemCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var photo: UIImageView!

    func config(item: Item) {
        nameLabel.text = item.name.substring(after: 4)
        photo.setImage(imageUrl: item.photoURL)
    }
}
