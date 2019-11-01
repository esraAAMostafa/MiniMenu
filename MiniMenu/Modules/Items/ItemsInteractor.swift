//
//  ItemsInteractor.swift
//  MiniMenu
//
//  Created by Esraa on 11/1/19.
//  Copyright © 2019 task. All rights reserved.
//

import Foundation

class ItemsInteractor {
    
    var presnter: ItemsPresenter
    let menuRepo: MenuRepo
    
    init(presnter: ItemsPresenter, menuRepo: MenuRepo = MenuRepoImpl()) {
        self.presnter = presnter
        self.menuRepo = menuRepo
    }
    
    func getItems(with tagName: String) {
        menuRepo.getItems(for: tagName, completionHandler: { (items) in
            self.presnter.getItemsSuccess(with: items)
        }) { (error) in
            self.presnter.getItemsFail(with: error)
        }
    }
}
