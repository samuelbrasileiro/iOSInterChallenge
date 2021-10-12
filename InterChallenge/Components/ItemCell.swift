import UIKit

/// A generic table view cell with custom codable data type
class ItemCell<ItemType>: UITableViewCell, ConfigurableCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configure()
        setConstraints()
    }
    
    func setData(item: ItemType) { }
    
    func setConstraints() { }
    
    func configure() { }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
