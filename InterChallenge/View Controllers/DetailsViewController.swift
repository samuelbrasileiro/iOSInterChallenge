import UIKit

class DetailsViewController: UIViewController, DetailsViewModelDelegate {
    
    var viewModel = DetailsViewModel()
    
    weak var coodinator: MainCoordinator?
    
    let detailImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.sizeToFit()
        return imageView
    }()
    
    let nameLabel = UILabel.with(name: "name")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        
        self.view.addSubview(detailImageView)
        self.view.addSubview(nameLabel)
        
        
        configureConstraints()
    }
    
    func configure(photo: Photo){
        self.viewModel.delegate = self
        self.viewModel.configure(photo: photo)
    }
    
    func configureConstraints(){
        detailImageView.heightAnchor.constraint(equalToConstant: 250).isActive = true
        
        detailImageView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 24).isActive = true
        detailImageView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 16).isActive = true
        detailImageView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -24).isActive = true
        
        nameLabel.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -24).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 24).isActive = true
        nameLabel.topAnchor.constraint(equalTo: self.detailImageView.bottomAnchor, constant: 16).isActive = true
    }
    
    func reloadName(_ name: String) {
        self.nameLabel.text = name
    }
    
    func reloadImage(_ image: UIImage) {
        self.detailImageView.image = image
    }
    
}
