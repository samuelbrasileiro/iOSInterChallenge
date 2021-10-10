import UIKit

class TitleAndDescriptionTableViewCell<ItemType>: GenericCell<ItemType>
where ItemType: TitleAndDescription {
    
    let titleLabel = UILabel.with(name: "title")
    let descriptionLabel = UILabel.with(name: "description")
    
    override func configure() {
        self.contentView.addSubview(titleLabel)
        self.contentView.addSubview(descriptionLabel)
    }
    
    override func setData(item: ItemType) {
            self.titleLabel.text = item.title
            self.descriptionLabel.text = item.description
    }
    
    override func setConstraints() {
        titleLabel.leadingAnchor.constraint(
            equalTo: self.contentView.leadingAnchor, constant: 16).isActive = true
        titleLabel.trailingAnchor.constraint(
            equalTo: self.contentView.trailingAnchor, constant: -16).isActive = true
        titleLabel.topAnchor.constraint(
            equalTo: self.contentView.topAnchor, constant: 16).isActive = true
        descriptionLabel.leadingAnchor.constraint(
            equalTo: self.contentView.leadingAnchor, constant: 16).isActive = true
        descriptionLabel.trailingAnchor.constraint(
            equalTo: self.contentView.trailingAnchor, constant: -16).isActive = true
        descriptionLabel.topAnchor.constraint(
            equalTo: self.titleLabel.bottomAnchor, constant: 16).isActive = true
        descriptionLabel.bottomAnchor.constraint(
            equalTo: self.contentView.bottomAnchor, constant: -8).isActive = true
        
    }
    
}
