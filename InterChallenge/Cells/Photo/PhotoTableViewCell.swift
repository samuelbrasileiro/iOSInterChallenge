import UIKit
import Alamofire
class PhotoTableViewCell: UITableViewCell {

    let titleLabel = UILabel.with(name: "title")
    let photoImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.addSubview(titleLabel)
        self.contentView.addSubview(photoImageView)
        photoImageView.widthAnchor.constraint(equalToConstant: 150).isActive = true
        photoImageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        photoImageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 16).isActive = true
        photoImageView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 8).isActive = true
        photoImageView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -8).isActive = true
        
        titleLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -16).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: photoImageView.trailingAnchor, constant: 16).isActive = true
        titleLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 16).isActive = true
        
    }
    
    func configure(photo: Photo){
        self.titleLabel.text = photo.title
        AF.download(photo.thumbnailUrl).responseData { response in
            switch response.result {
            case .success(let data):
                self.photoImageView.image = UIImage(data: data)
            default:
                break
            }
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
