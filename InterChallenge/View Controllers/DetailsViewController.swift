import UIKit

class DetailsViewController: UIViewController {
    
    let detailImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.sizeToFit()
        return imageView
    }()
    
    let nameLabel  =  UILabel.with(name: "name")
    
    var photo = UIImage()
    var name = String()
    
    override func loadView() {
        self.view = UIView()
        self.view.backgroundColor = .systemBackground
        
        self.view.addSubview(detailImageView)
        self.view.addSubview(nameLabel)
        
        detailImageView.image =  photo
        nameLabel.text = name
        detailImageView.heightAnchor.constraint(equalToConstant: 250).isActive = true
        
        detailImageView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 24).isActive = true
        detailImageView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 16).isActive = true
        detailImageView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -24).isActive = true
        
        nameLabel.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -24).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 24).isActive = true
        nameLabel.topAnchor.constraint(equalTo: self.detailImageView.bottomAnchor, constant: 16).isActive = true
        
    }
    
}
