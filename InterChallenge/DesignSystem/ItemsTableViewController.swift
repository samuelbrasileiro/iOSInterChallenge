//
//  ItemsTableViewController.swift
//  InterChallenge
//
//  Created by Samuel Brasileiro on 08/10/21.
//

import UIKit

/// A Generic TableViewController that contains generic cells with codable data
class ItemsTableViewController<ItemType, CellType>: UITableViewController, 
                                                    GenericTableViewController, CellConfigurationDelegate
where CellType: ItemCell<ItemType>, ItemType: Codable {
        
    var viewModel = TableViewModel<ItemType>()
    
    weak var coordinator: MainCoordinator?
    
    init(itemId: Int? = nil) {
        super.init(nibName: nil, bundle: nil)
        
        self.viewModel.setURL(itemId: itemId)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        tableView.register(CellType.self, forCellReuseIdentifier: viewModel.getCellIdentifier())
        
        self.setItems()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.getItemsCount()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
                withIdentifier: viewModel.getCellIdentifier(), for: indexPath) as? CellType else {
            return UITableViewCell()
        }
        if let item = self.viewModel.getItem(at: indexPath.row) {
        
            cell.setData(item: item)
            cellConfigurationCompletion(cell: cell, at: indexPath.row)
        }
        
        return cell
    }
    
    func selectionFunction(item: ItemType) { }
    
    func cellConfigurationCompletion(cell: CellType, at row: Int) { }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let item = self.viewModel.getItem(at: indexPath.row) {
            selectionFunction(item: item)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
