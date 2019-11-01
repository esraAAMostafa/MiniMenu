//
//  ItemDetailsView.swift
//  MiniMenu
//
//  Created by Esraa on 11/1/19.
//  Copyright © 2019 task. All rights reserved.
//

import UIKit

protocol ItemDetailsViewDelegate {
    func initItemDetails(_ item: Item)
}

class ItemDetailsView: UIViewController, ItemDetailsViewDelegate {
        
    @IBOutlet weak var itemNameLabel: UILabel!
    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var descriptionTV: UITextView!

    func initItemDetails(_ item: Item) {
        itemNameLabel.text = item.name.substring(after: 4)
        photo.setImage(imageUrl: item.photoURL)
        descriptionTV.text = item.itemDescription
    }

    @IBAction func backButtonIsPressed(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
}
