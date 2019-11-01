//
//  TagsView.swift
//  MiniMenu
//
//  Created by Esraa on 11/1/19.
//  Copyright © 2019 task. All rights reserved.
//

import UIKit

protocol TagsViewDelegate {
    func updateCollectionView(with tags: TagsList)
    func showAlert(with message: String)
}

private let reuseIdentifier = "TagCell"

class TagsView: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var interactor: TagsInteractor!
    var tags: TagsList = []
    
    var page = 0
    
    lazy var myRefreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(self.handleRefresh(_:)), for: .valueChanged)
        refreshControl.tintColor = UIColor.red
        return refreshControl
    }()
    
    @objc func handleRefresh(_ refreshControl: UIRefreshControl) {
        page = 0
        tags = []
        collectionView.reloadData()
        getMoreTags()
        refreshControl.endRefreshing()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.interactor = TagsInteractor(presnter: TagsPresenter(tagsView: self))
        
        getMoreTags()
        self.clearsSelectionOnViewWillAppear = false
        self.collectionView.addSubview(self.myRefreshControl)
        self.collectionView!.register(TagCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }
    
    private func getMoreTags() {
        self.page += 1
        interactor.getTags(in: page)
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
      return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tags.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row > ((page * 10) - 5) {
            getMoreTags()
        }

        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? TagCell {
            cell.config(tag: tags[indexPath.row])
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width / 3, height: 100)
    }
}

extension TagsView: TagsViewDelegate {
    func updateCollectionView(with tags: TagsList) {
        self.tags = tags
        collectionView.reloadData()
    }
    
    func showAlert(with message: String) {
        
    }
}
