//
//  ItemsPresenter.swift
//  MiniMenu
//
//  Created by Esraa on 11/1/19.
//  Copyright © 2019 task. All rights reserved.
//

import Foundation

class ItemsPresenter {
    
    let itemsView: ItemsViewDelegate
    
    init(itemsView: ItemsViewDelegate) {
        self.itemsView = itemsView
    }
    
    func getItemsSuccess(with items: ItemsList) {
        itemsView.updateItemsView(with: items)
    }
    
    func getItemsFail(with error: String) {
        itemsView.showAlert(with: error)
    }
}
