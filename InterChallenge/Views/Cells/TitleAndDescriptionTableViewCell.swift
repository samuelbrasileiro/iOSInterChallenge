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
        titleLabel.leadingAnchor.constraint(
            equalTo: contentView.leadingAnchor, constant: 16).isActive = true
        titleLabel.trailingAnchor.constraint(
            equalTo: contentView.trailingAnchor, constant: -16).isActive = true
        titleLabel.topAnchor.constraint(
            equalTo: contentView.topAnchor, constant: 16).isActive = true
        descriptionLabel.leadingAnchor.constraint(
            equalTo: contentView.leadingAnchor, constant: 16).isActive = true
        descriptionLabel.trailingAnchor.constraint(
            equalTo: contentView.trailingAnchor, constant: -16).isActive = true
        descriptionLabel.topAnchor.constraint(
            equalTo: titleLabel.bottomAnchor, constant: 16).isActive = true
        descriptionLabel.bottomAnchor.constraint(
            equalTo: contentView.bottomAnchor, constant: -8).isActive = true
        
    }
    
}
