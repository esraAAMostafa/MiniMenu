//
//  ItemDetailsView.swift
//  MiniMenu
//
//  Created by Esraa on 11/1/19.
//  Copyright © 2019 task. All rights reserved.
//

import UIKit
import MXParallaxHeader

protocol ItemDetailsViewDelegate {
    func initItemDetails(_ item: Item)
}

class ItemDetailsView: UIViewController, ItemDetailsViewDelegate {
        
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var itemNameLabel: UILabel!
    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var descriptionTV: UITextView!

    func initItemDetails(_ item: Item) {
        scrollView.parallaxHeader.view = photo
        scrollView.parallaxHeader.height = self.view.frame.height * 0.3
        scrollView.parallaxHeader.mode = .fill
        scrollView.parallaxHeader.minimumHeight = 0
        
        itemNameLabel.text = item.name.substring(after: 4)
        self.view.hero.isEnabled = true
        photo.hero.id = "ItemPhotoId\(item.id)"
        photo.hero.modifiers = [.fade, .duration(0.9)]
        photo.setImage(imageUrl: item.photoURL)
        descriptionTV.text = item.itemDescription
    }

    @IBAction func backButtonIsPressed(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
}
