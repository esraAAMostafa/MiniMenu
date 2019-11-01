//
//  ItemsView.swift
//  MiniMenu
//
//  Created by Esraa on 11/1/19.
//  Copyright © 2019 task. All rights reserved.
//

import UIKit

protocol ItemsViewDelegate {
    func updateItemsView(with items: ItemsList)
    func showAlert(with message: String)
}

class ItemsView: UITableViewController {

    private let reuseIdentifier = "ItemCell"

    var delegate: HomeProtocol!
    var interactor: ItemsInteractor!

    var items: ItemsList = []

    override func viewDidLoad() {
        super.viewDidLoad()
         self.clearsSelectionOnViewWillAppear = false
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as? ItemCell {
            cell.config(item: items[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.view.frame.height / 5
    }
}

extension ItemsView: ItemsViewDelegate {
    func updateItemsView(with items: ItemsList) {
        self.items.append(contentsOf: items)
        tableView.reloadData()
    }
    
    func showAlert(with message: String) {
        delegate.showAlert(with: message)
    }
}

