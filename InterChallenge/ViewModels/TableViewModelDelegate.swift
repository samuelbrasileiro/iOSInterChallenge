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
            if case .success(nil) = result {
                self.tableView.reloadData()
            } else {
                let alert = UIAlertController(title: "Erro",
                                              message: "Algo errado aconteceu. Tente novamente mais tarde.",
                                              preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { _ in
                    alert.dismiss(animated: true)
                }))
                self.present(alert, animated: true)
            }
        }
    }
}
