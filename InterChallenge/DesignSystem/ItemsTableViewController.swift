//
//  ItemsTableViewController.swift
//  InterChallenge
//
//  Created by Samuel Brasileiro on 08/10/21.
//

import UIKit
protocol ConfigurableCell{
    func configure<T>(item: T)
}

 
class ItemsTableViewController<CellType, ItemType>: UITableViewController, TableViewModelDelegate
where CellType: UITableViewCell, CellType: ConfigurableCell, ItemType: Codable{
    
    typealias T = ItemType
    
    var viewModel = TableViewModel<ItemType>()
        
    var url: String
    
    var cellIdentifier: String
    
    func cellConfigurationCompletion(cell: CellType, at cellRow: Int){
         
    }
    
    func selectionFunction(item: ItemType){
        
    }
    
    init(url: String, cellIdentifier: String){
        self.url = url
        self.cellIdentifier = cellIdentifier
        
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        tableView.register(CellType.self, forCellReuseIdentifier: cellIdentifier)
                
        self.fillData(url: url)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.items.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? CellType else {
            return UITableViewCell()
        }
        
        let item = self.viewModel.items[indexPath.row]
        
        cell.configure(item: item)
        cellConfigurationCompletion(cell: cell, at: indexPath.row)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = self.viewModel.items[indexPath.row]
        selectionFunction(item: item)
        
    }
    
}
