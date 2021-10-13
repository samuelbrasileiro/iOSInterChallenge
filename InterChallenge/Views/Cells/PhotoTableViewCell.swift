import UIKit
import Alamofire

class PhotoTableViewCell: ItemCell<Photo> {
    
    // MARK: - Attributes
    let titleLabel = UILabel.with(text: "title", numberOfLines: 5)
    
    let photoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
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
        photoImageView
            .make(.width, equalTo: nil, constant: 150)
            .make(.height, greaterThanOrEqualTo: nil, constant: 150)
            .make(.leading, equalTo: contentView, attribute: .leading, constant: 16)
            .make(.top, equalTo: contentView, attribute: .top, constant: 8)
            .make(.bottom, equalTo: contentView, attribute: .bottom, constant: -8)
        
        titleLabel
            .make(.leading, equalTo: photoImageView, attribute: .trailing, constant: 16)
            .make(.trailing, equalTo: contentView, attribute: .trailing, constant: -16)
            .make(.top, equalTo: contentView, attribute: .top, constant: 60)
    }
    
    override func prepareForReuse() {
        self.photoImageView.image = nil
    }
}
