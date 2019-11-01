//
//  TagsView.swift
//  MiniMenu
//
//  Created by Esraa on 11/1/19.
//  Copyright © 2019 task. All rights reserved.
//

import UIKit

protocol TagsViewDelegate {
    func updateTagsView(with tags: TagsList)
    func showAlert(with message: String)
}

class TagsView: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    private let reuseIdentifier = "TagCell"

    var delegate: HomeViewProtocol!
    var interactor: TagsInteractor!
    
    var page = 0
    var tags: TagsList = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.interactor = TagsInteractor(presnter: TagsPresenter(tagsView: self))

        getMoreTags()
    }
    
    private func getMoreTags() {
        self.page += 1
        interactor.getTags(in: page)
    }
    
    private func needMorePages(_ index: Int) -> Bool {
        return index > (tags.count - 5)
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tags.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        if needMorePages(indexPath.row) { getMoreTags() }

        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? TagCell {
            cell.config(tag: tags[indexPath.row])
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width / 3, height: self.view.frame.height)
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate.select(tag: tags[indexPath.row])
    }
}

extension TagsView: TagsViewDelegate {
    func updateTagsView(with tags: TagsList) {
        self.tags.append(contentsOf: tags)
        collectionView.reloadData()
    }
    
    func showAlert(with message: String) {
        delegate.showAlert(with: message)
    }
}
