//
//  ItemsTableViewController.swift
//  InterChallenge
//
//  Created by Samuel Brasileiro on 08/10/21.
//

import UIKit

class ItemsTableViewController<CellType, ItemType>: UITableViewController, TableViewModelDelegate, CellConfigurationDelegate
where CellType: UITableViewCell, CellType: ConfigurableCell, ItemType: Codable{
    
    typealias T = ItemType
    var viewModel = TableViewModel<ItemType>()
    
    weak var coordinator: MainCoordinator?
    
    init(id: Int? = nil){
                
        super.init(nibName: nil, bundle: nil)
        
        self.viewModel.setURL(id: id)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        tableView.register(CellType.self, forCellReuseIdentifier: viewModel.cellIdentifier)
        
        self.fillData()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: viewModel.cellIdentifier, for: indexPath) as? CellType else {
            return UITableViewCell()
        }
        
        let item = self.viewModel.items[indexPath.row]
        
        cell.configure(item: item)
        cellConfigurationCompletion(cell: cell, at: indexPath.row)
        
        return cell
    }
    
    func cellConfigurationCompletion(cell: CellType, at cellRow: Int){
        
    }
    
    func selectionFunction(item:  ItemType){
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = self.viewModel.items[indexPath.row]
        selectionFunction(item: item)
        
    }
    
}
