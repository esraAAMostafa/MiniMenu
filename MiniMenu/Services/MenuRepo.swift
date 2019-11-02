//
//  MenuRepo.swift
//  MiniMenu
//
//  Created by Esraa on 10/31/19.
//  Copyright © 2019 task. All rights reserved.
//

import Foundation

protocol MenuRepo {
    func getTags(of page: Int, completionHandler: @escaping (TagsList) -> Void, failHandler: @escaping (String) -> Void)
    func getItems(for tagName: String, completionHandler: @escaping (ItemsList) -> Void, failHandler: @escaping (String) -> Void)
}

class MenuRepoImpl: MenuRepo {
    
    let networkManager: AlamofireService
    private let realm: RealmService

    init(networkManager: AlamofireService = AlamofireServiceImpl(), realm: RealmService = RealmService.shared) {
        self.networkManager = networkManager
        self.realm = realm
    }
    
    private func updateCachedTags(_ tags: TagsList) {
        realm.appendObjects(tags.map({StoredTag(tag: $0)}))
    }
    
    //to be used when we need to retrieve from cache
    private func retrieveTagsFromCache() -> TagsList? {
        if let storedTags = realm.get(type: StoredTag.self) as? [StoredTag] {
            return storedTags.map({$0.toModel()})
        }
        return nil
    }
    
    func getTags(of page: Int, completionHandler: @escaping (TagsList) -> Void, failHandler: @escaping (String) -> Void) {
        networkManager.call(endPoint: TagsEndPoint(page: page), for: TagsResponse.self, completionHandler: { (response) in

            let tags = response.mapToTags()
            self.updateCachedTags(tags)
            completionHandler(tags)
        }) { (error) in
                        failHandler(error.message)
        }
    }
    
    private func updateCachedItems(for tagName: String, _ items: ItemsList) {
        realm.appendObjects(items.map({StoredItem(item: $0, tagName: tagName)}))
    }
    
    //to be used when we need to retrieve from cache
    private func retrieveItemsFromCache() -> ItemsList? {
        if let storedItems = realm.get(type: StoredItem.self) as? [StoredItem] {
            return storedItems.map({$0.toModel()})
        }
        return nil
    }
    
    func getItems(for tagName: String, completionHandler: @escaping (ItemsList) -> Void, failHandler: @escaping (String) -> Void) {

        networkManager.call(endPoint: ItemsEndPoint(tagName: tagName), for: ItemsResponse.self, completionHandler: { (response) in

            let items = response.mapToItems()
            self.updateCachedItems(for: tagName, items)
            completionHandler(items)
        }) { (error) in
            failHandler(error.message)
        }
    }
}
