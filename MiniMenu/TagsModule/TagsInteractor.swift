//
//  TagsInteractor.swift
//  MiniMenu
//
//  Created by Esraa on 11/1/19.
//  Copyright © 2019 task. All rights reserved.
//

import Foundation

class TagsInteractor {
    
    var presnter: TagsPresenter
    let menuRepo: MenuRepo
    
    init(presnter: TagsPresenter, menuRepo: MenuRepo = MenuRepoImpl()) {
        self.presnter = presnter
        self.menuRepo = menuRepo
    }
    
    func getTags(in page: Int) {
        menuRepo.getTags(of: page, completionHandler: {(tags) in
            self.presnter.getTagsSuccess(with: tags)
        }) { (error) in
            self.presnter.getTagsFail(with: error)
        }
    }
}
