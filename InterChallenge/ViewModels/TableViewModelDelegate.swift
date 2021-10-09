//
//  fillDataDelegate.swift
//  InterChallenge
//
//  Created by Samuel Brasileiro on 08/10/21.
//

import UIKit

protocol TableViewGeneric {
    associatedtype ItemType where ItemType: Codable
    var viewModel: TableViewModel<ItemType> {get set}
    func fillData()
    func selectionFunction(item: ItemType)
}

extension TableViewGeneric where Self: UITableViewController {
    func fillData() {
        viewModel.fillItems {  [weak self] result in
            guard let self = self else { return }
            if case .failure(let error) = result {
                print(error)
                let alert = UIAlertController(title: "Error",
                                              message: error.localizedDescription,
                                              preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { _ in
                    alert.dismiss(animated: true)
                }))
                self.present(alert, animated: true)
            } else {
                self.tableView.reloadData()
            }
        }
    }
}
