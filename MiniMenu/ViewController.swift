//
//  ViewController.swift
//  MiniMenu
//
//  Created by Esraa on 10/30/19.
//  Copyright © 2019 task. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let x: NetworkManagerProtocol = NetworkManager()
        x.callAPI(Tags(), endPoint: TagsEndPoint(page: 1), completionHandler: { (response) in
            print(response.tags[0].tagName)
        }) { (error) in
            print(error.message)
        }
        
        x.callAPI(Items(), endPoint: ItemsEndPoint(tagName: "1 - Deserts"), completionHandler: { (response) in
            print(response)
        }) { (error) in
            print(error.message)
        }
    }
}
