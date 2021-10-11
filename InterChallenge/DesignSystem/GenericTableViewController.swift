//
//  fillDataDelegate.swift
//  InterChallenge
//
//  Created by Samuel Brasileiro on 08/10/21.
//

import UIKit

protocol GenericTableViewController: UITableViewController, ErrorHandler {
    associatedtype ItemType where ItemType: Codable
    
    var viewModel: TableViewModel<ItemType> {get set}
    
    func setItems()
    func setTitle(name: String)
    func selectionFunction(item: ItemType)
}

extension GenericTableViewController where Self: UITableViewController {
    
    func setTitle(name: String) {
        self.viewModel.setUsername(name: name)
    }
    
    func setItems() {
        viewModel.fetchItemsFromAPI {  [weak self] error in
            guard let self = self else { return }
            
            if let error = error {
                print(error)
                
                self.handleError(error: error)
                
            } else {
                self.tableView.reloadData()
            }
        }
    }
}
