import UIKit

class TitleAndDescriptionTableViewCell<ItemType>: ItemCell<ItemType>
where ItemType: TitleAndDescription {
    
    // MARK: - Attributes
    let titleLabel = UILabel.withName("title")
    let descriptionLabel = UILabel.withName("description")
    
    // MARK: - Methods
    override func configure() {
        contentView
            .add(subview: titleLabel)
            .add(subview: descriptionLabel)
    }
    
    override func setData(item: ItemType) {
        titleLabel.text = item.title
        descriptionLabel.text = item.description
    }
    
    override func setConstraints() {
        titleLabel
            .make(.leading, equalTo: contentView, attribute: .leading, constant: 16)
            .make(.trailing, equalTo: contentView, attribute: .trailing, constant: -16)
            .make(.top, equalTo: contentView, attribute: .top, constant: 16)
        
        descriptionLabel
            .make(.leading, equalTo: contentView, attribute: .leading, constant: 16)
            .make(.trailing, equalTo: contentView, attribute: .trailing, constant: -16)
            .make(.top, equalTo: titleLabel, attribute: .bottom, constant: 16)
            .make(.bottom, equalTo: contentView, attribute: .bottom, constant: -8)
    }
}
