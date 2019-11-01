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
        let x: MenuRepo = MenuRepoImpl()
        x.getTags(of: 1, completionHandler: { (tags) in
            x.getItems(for: tags[0].tagName, completionHandler: { (items) in
                print(items[0].name)
            }) { (error) in
                print(error)
            }
        }) { (error) in
            print(error)
        }
    
        
    }
}
