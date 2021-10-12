import UIKit

protocol GenericTableViewController: UITableViewController, ErrorHandler {
    associatedtype ItemType where ItemType: Codable
    
    var viewModel: TableViewModel<ItemType> {get set}
    
    /// This function set the view model data
    func setItems()
    
    /// This function sets the view model username
    /// - Parameter name: The name in which the username will be changed to
    func setTitle(name: String)
    
    /// This function is activated when a cell is selected
    /// - Parameter item: Item of a cell that has been selected
    func selectionFunction(item: ItemType)
    
    /// This function reloads the table view data
    func update()
}

extension GenericTableViewController where Self: UITableViewController {
    
    func setTitle(name: String) {
        self.viewModel.setUsername(name: name)
    }
    
    func setItems() {
        viewModel.fillData {  [weak self] error in
            if let error = error {
                print(error)
                self?.handleError(error: error)
            } else {
                self?.update()
            }
        }
    }
    
    func update() {
        self.tableView.reloadData()
    }
}
