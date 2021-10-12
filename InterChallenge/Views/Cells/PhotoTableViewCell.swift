import UIKit
import Alamofire

class PhotoTableViewCell: ItemCell<Photo> {
    
    // MARK: - Attributes
    let titleLabel = UILabel.withName("title")
    
    let photoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    // MARK: - Methods
    override func configure() {
        contentView
            .add(subview: titleLabel)
            .add(subview: photoImageView)
    }
    
    override func setData(item: Photo) {
        self.titleLabel.text = item.title
    }
    
    override func setConstraints() {
        photoImageView.widthAnchor.constraint(equalToConstant: 150).isActive = true
        photoImageView.heightAnchor.constraint(greaterThanOrEqualToConstant: 150).isActive = true
        
        photoImageView.leadingAnchor.constraint(
            equalTo: self.contentView.leadingAnchor, constant: 16).isActive = true
        photoImageView.topAnchor.constraint(
            equalTo: self.contentView.topAnchor, constant: 8).isActive = true
        photoImageView.bottomAnchor.constraint(
            equalTo: self.contentView.bottomAnchor, constant: -8).isActive = true
        
        titleLabel.trailingAnchor.constraint(
            equalTo: self.contentView.trailingAnchor, constant: -16).isActive = true
        titleLabel.leadingAnchor.constraint(
            equalTo: photoImageView.trailingAnchor, constant: 16).isActive = true
        titleLabel.topAnchor.constraint(
            equalTo: self.contentView.topAnchor, constant: 16).isActive = true
    }
    
    override func prepareForReuse() {
        self.photoImageView.image = nil
    }
}
