//
//  HomeView.swift
//  MiniMenu
//
//  Created by Esraa on 10/30/19.
//  Copyright © 2019 task. All rights reserved.
//

import UIKit

protocol HomeViewProtocol {
    func select(tag: Tag)
    func setItemsViewHeight(_ height: CGFloat)
    func showAlert(with error: String)
}

class HomeView: UIViewController {
    
    var selectedTagName: String = ""
    var itemsDelegate: ItemsViewDelegate!

    @IBOutlet weak var itemsViewHeight: NSLayoutConstraint!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "ToTagsView":
            if let embedView = segue.destination as? TagsView {
                embedView.delegate = self
            }
        case "ToItemsView":
            if let embedView = segue.destination as? ItemsView {
                embedView.homeDelegate = self
                itemsDelegate = embedView
            }
        default: break
        }
    }
}

extension HomeView: HomeViewProtocol {
    func setItemsViewHeight(_ height: CGFloat) {
        itemsViewHeight.constant = height
    }

    func select(tag: Tag) {
        itemsDelegate.setSelectedTage(name: tag.name)
    }

    func showAlert(with error: String) {
        alert(title: "", message: error, actions: [("ok", .default)])
    }
}
