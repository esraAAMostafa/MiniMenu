//
//  MenuRepo.swift
//  MiniMenu
//
//  Created by Esraa on 10/31/19.
//  Copyright © 2019 task. All rights reserved.
//

import Foundation

protocol MenuRepo {
    func getTags(of page: Int, completionHandler: @escaping (Tags) -> Void, failHandler: @escaping (String) -> Void)
    func getItems(for tagName: String, completionHandler: @escaping (Items) -> Void, failHandler: @escaping (String) -> Void)
}

class MenuRepoImpl: MenuRepo {
    
    let networkManager: NetworkManager
    
    init(networkManager: NetworkManager = NetworkManagerImpl()) {
        self.networkManager = networkManager
    }
    
    func getTags(of page: Int, completionHandler: @escaping (Tags) -> Void, failHandler: @escaping (String) -> Void) {
        networkManager.call(endPoint: TagsEndPoint(page: page), for: Tags(), completionHandler: { (response) in
            completionHandler(response.tags)
        }) { (error) in
            failHandler(error.message)
        }
    }
    
    func getItems(for tagName: String, completionHandler: @escaping (Items) -> Void, failHandler: @escaping (String) -> Void) {
        networkManager.call(endPoint: ItemsEndPoint(tagName: tagName), for: Items(), completionHandler: { (response) in
            completionHandler(response.items)
        }) { (error) in
            failHandler(error.message)
        }
    }
}
