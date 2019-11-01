//
//  TagsPresenter.swift
//  MiniMenu
//
//  Created by Esraa on 11/1/19.
//  Copyright © 2019 task. All rights reserved.
//

import Foundation

class TagsPresenter {
    
    let tagsView: TagsViewDelegate
    
    init(tagsView: TagsViewDelegate) {
        self.tagsView = tagsView
    }
    
    func getTagsSuccess(with tags: TagsList) {
        tagsView.updateCollectionView(with: tags)
    }
    
    func getTagsFail(with error: String) {
        tagsView.showAlert(with: error)
    }
}
