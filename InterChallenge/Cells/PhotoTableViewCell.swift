import UIKit
import Alamofire

class PhotoTableViewCell: GenericCell<Photo> {
    
    var apiService = APIService<Photo>()
    
    let titleLabel = UILabel.with(name: "title")
    
    let photoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override func configure() {
        self.contentView.addSubview(titleLabel)
        self.contentView.addSubview(photoImageView)
    }
    
    override func setData(item: Photo) {
        self.titleLabel.text = item.title
        
        apiService.downloadImage(from: item.thumbnailUrl) { result in
        
            if case .success(let image) = result {
                self.photoImageView.image = image
            }
        }
    }
    
    override func setConstraints() {
        photoImageView.widthAnchor.constraint(equalToConstant: 150).isActive = true
        photoImageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
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
}
