//
//  ViewController.swift
//  MiniMenu
//
//  Created by Esraa on 10/30/19.
//  Copyright © 2019 task. All rights reserved.
//

import UIKit

protocol HomeProtocol {
    func select(tag: Tag)
    func showAlert(with error: String)
}

class ViewController: UIViewController {
    
    var selectedTagName: String = ""
    
    var itemsDelegate: ItemsViewDelegate!

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
                embedView.delegate = self
                itemsDelegate = embedView
            }
        default: break
        }
    }
}

extension ViewController: HomeProtocol {
    func select(tag: Tag) {
        itemsDelegate.setSelectedTage(name: tag.name)
    }

    func showAlert(with error: String) {
        alert(title: "", message: error, actions: [("ok", .default)])
    }
}
