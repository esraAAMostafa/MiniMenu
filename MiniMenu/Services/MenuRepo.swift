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
    
    let networkManager: NetworkManager
    
    init(networkManager: NetworkManager = NetworkManagerImpl()) {
        self.networkManager = networkManager
    }
    
    func getTags(of page: Int, completionHandler: @escaping (TagsList) -> Void, failHandler: @escaping (String) -> Void) {

        networkManager.call(endPoint: TagsEndPoint(page: page), for: TagsResponse.self, completionHandler: { (response) in
            completionHandler(response.mapToTags())
        }) { (error) in
            failHandler(error)
        }
    }
    
    func getItems(for tagName: String, completionHandler: @escaping (ItemsList) -> Void, failHandler: @escaping (String) -> Void) {

        networkManager.call(endPoint: ItemsEndPoint(tagName: tagName), for: ItemsResponse.self, completionHandler: { (response) in
            completionHandler(response.mapToItems())
        }) { (error) in
            failHandler(error)
        }
    }
}
