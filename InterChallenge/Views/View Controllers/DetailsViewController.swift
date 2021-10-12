import UIKit

class DetailsViewController: UIViewController, DetailsViewModelDelegate, ErrorHandler {
    
    // MARK: - Attributes
    var viewModel = DetailsViewModel()
    weak var coodinator: MainCoordinator?
    
    let detailImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.sizeToFit()
        return imageView
    }()
    
    let nameLabel = UILabel.withName("name")
    
    // MARK: - Initializers
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        
        viewModel.errorHandler = self
        
        configureView()
        
        setConstraints()
    }
    
    // MARK: - Methods
    func configureView() {
        self.view.addSubview(detailImageView)
        self.view.addSubview(nameLabel)
    }
    
    func configure(photo: Photo) {
        self.viewModel.delegate = self
        self.viewModel.configure(photo: photo)
        
        self.title = "Detalhes"
    }
    
    func setConstraints() {
        detailImageView.heightAnchor.constraint(equalToConstant: 250).isActive = true
        detailImageView.leadingAnchor.constraint(
            equalTo: self.view.safeAreaLayoutGuide.leadingAnchor,
            constant: 24).isActive = true
        detailImageView.topAnchor.constraint(
            equalTo: self.view.safeAreaLayoutGuide.topAnchor,
            constant: 16).isActive = true
        detailImageView.trailingAnchor.constraint(
            equalTo: self.view.trailingAnchor,
            constant: -24).isActive = true
        nameLabel.trailingAnchor.constraint(
            equalTo: self.view.safeAreaLayoutGuide.trailingAnchor,
            constant: -24).isActive = true
        nameLabel.leadingAnchor.constraint(
            equalTo: self.view.safeAreaLayoutGuide.leadingAnchor,
            constant: 24).isActive = true
        nameLabel.topAnchor.constraint(
            equalTo: self.detailImageView.bottomAnchor,
            constant: 16).isActive = true
    }
    
    func reloadName(_ name: String) {
        self.nameLabel.text = name
    }
    
    func reloadImage(_ image: UIImage) {
        self.detailImageView.image = image
    }
    
}
