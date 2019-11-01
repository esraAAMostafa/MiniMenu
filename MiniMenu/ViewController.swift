//
//  ViewController.swift
//  MiniMenu
//
//  Created by Esraa on 10/30/19.
//  Copyright © 2019 task. All rights reserved.
//

import UIKit

protocol HomeProtocol {
    func showAlert(with error: String)
}

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ToTagsView" {
            if let embedView = segue.description as? TagsView {
                embedView.delegate = self
            }
        }
    }
}

extension ViewController: HomeProtocol {
    
    func showAlert(with error: String) {
        alert(title: "", message: error, actions: [("ok", .default)])
    }
}
