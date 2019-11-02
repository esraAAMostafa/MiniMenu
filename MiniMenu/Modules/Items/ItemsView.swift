//
//  ItemsView.swift
//  MiniMenu
//
//  Created by Esraa on 11/1/19.
//  Copyright © 2019 task. All rights reserved.
//

import UIKit

protocol ItemsViewDelegate {
    func setSelectedTage(name: String)
    func updateItemsView(with items: ItemsList)
    func showAlert(with message: String)
}

class ItemsView: UITableViewController {

    private let reuseIdentifier = "ItemCell"
    private let cellHeight: CGFloat = 150

    var homeDelegate: HomeViewProtocol!
    var interactor: ItemsInteractor!
    var itemDetailsDelegate: ItemDetailsViewDelegate!

    var items: ItemsList = []
    
    var tagName: String!

    lazy var myRefreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(self.handleRefresh(_:)), for: .valueChanged)
        return refreshControl
    }()
    
    @objc func handleRefresh(_ refreshControl: UIRefreshControl) {
        if tagName != nil && tagName != "" {
            interactor.getItems(with: tagName)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.addSubview(self.myRefreshControl)
        self.interactor = ItemsInteractor(presnter: ItemsPresenter(itemsView: self))
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
        return cellHeight
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "ToItemDetails", sender: self)
        itemDetailsDelegate.initItemDetails(items[indexPath.row])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ToItemDetails" {
            if let nextVC = segue.destination as? ItemDetailsView {
                itemDetailsDelegate = nextVC
            }
        }
    }
}

extension ItemsView: ItemsViewDelegate {

    func setSelectedTage(name: String) {
        self.tagName = name
        myRefreshControl.beginScrollRefreshing(in: self.tableView)
        interactor.getItems(with: tagName)
    }

    func updateItemsView(with items: ItemsList) {
        self.items = items
        homeDelegate.setItemsViewHeight(CGFloat(items.count) * cellHeight)
        tableView.reloadData()
        myRefreshControl.endRefreshing()
    }
    
    func showAlert(with message: String) {
        homeDelegate.showAlert(with: message)
        myRefreshControl.endRefreshing()
    }
}
