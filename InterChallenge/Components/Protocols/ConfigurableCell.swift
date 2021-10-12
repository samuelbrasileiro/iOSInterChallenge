import UIKit

/// A UITableViewCell conformance to have generic configuration functions
protocol ConfigurableCell: UITableViewCell {
    associatedtype ItemType
    
    /// This function populates the cell with data
    /// - Parameter item: Data that will populate the view
    func setData(item: ItemType)
    
    /// This function sets all the constraints of the cell
    func setConstraints()
    
    /// This function make the initial setup to a cell
    func configure()
}
