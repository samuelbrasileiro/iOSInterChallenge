import UIKit

protocol CellConfigurationDelegate: AnyObject {
    associatedtype CellType
    
    /// This function handles a configuration for a cell in a UITableViewController scope
    /// - Parameters:
    ///   - cell: The cell in which will be configured 
    ///   - row: The index of the cell in a tableView
    func cellConfigurationCompletion(cell: CellType, at row: Int)
}
