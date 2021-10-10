//
//  ItemsTableViewController.swift
//  InterChallenge
//
//  Created by Samuel Brasileiro on 08/10/21.
//

import UIKit

class ItemsTableViewController<ItemType, CellType>: UITableViewController, TableViewGeneric, CellConfigurationDelegate
where CellType: GenericCell<ItemType>, ItemType: Codable {
        
    var viewModel = TableViewModel<ItemType>()
    
    weak var coordinator: MainCoordinator?
    
    init(itemId: Int? = nil) {
        super.init(nibName: nil, bundle: nil)
        
        self.viewModel.setURL(itemId: itemId)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        tableView.register(CellType.self, forCellReuseIdentifier: viewModel.cellIdentifier)
        
        self.fillData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
                withIdentifier: viewModel.cellIdentifier, for: indexPath) as? CellType else {
            return UITableViewCell()
        }
        let item = self.viewModel.items[indexPath.row]
        
        cell.setData(item: item)
        cellConfigurationCompletion(cell: cell, at: indexPath.row)
        
        return cell
    }
    
    func setTitle(name: String) {
        self.viewModel.setUsername(name: name)
    }
    
    func cellConfigurationCompletion(cell: CellType, at cellRow: Int) { }
    
    func selectionFunction(item: ItemType) {}
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = self.viewModel.items[indexPath.row]
        selectionFunction(item: item)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

enum TableType {
    case user
    case post
    case comment
    case album
    case photo
    
//    func returnType<ItemType, CellType>() -> ItemsTableViewController<ItemType, CellType>.Type
//    where CellType: GenericCell<ItemType>, ItemType: Codable{
//        switch(self){
//        case .user:
//            return ChallengeViewController
//        case .post:
//            return PostTableViewController.self as! T.Type
//        case .comment:
//            return CommentTableViewController.self as! T.Type
//        case .album:
//            return AlbumTableViewController.self as! T.Type
//        case .photo:
//            return PhotoTableViewController.self as! T.Type
//        }
//    }
}
