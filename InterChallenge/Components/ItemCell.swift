import UIKit

/// A generic table view cell with custom codable data type
class ItemCell<ItemType>: UITableViewCell, ConfigurableCell {
    
    // MARK: - Initializers 
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configure()
        setConstraints()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods 
    func setData(item: ItemType) { }
    
    func setConstraints() { }
    
    func configure() { }
    
}
