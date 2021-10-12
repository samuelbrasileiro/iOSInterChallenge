import UIKit

class DetailsViewController: UIViewController, DetailsViewModelDelegate, ErrorHandler {
    
    // MARK: - Attributes
    var viewModel = DetailsViewModel()
    weak var coodinator: MainCoordinator?
    
    let detailImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
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
        self.view
            .add(subview: detailImageView)
            .add(subview: nameLabel)
    }
    
    func configure(photo: Photo) {
        self.viewModel.delegate = self
        self.viewModel.configure(photo: photo)
        
        self.title = "Detalhes"
    }
    
    func setConstraints() {
        let safeArea = view.safeAreaLayoutGuide
        detailImageView
            .make(.height, lessThanOrEqualTo: nil, constant: 250)
            .make(.height, lessThanOrEqualTo: safeArea, attribute: .height, multipliedBy: 0.7)
            .make(.leading, equalTo: safeArea, attribute: .leading, constant: 24)
            .make(.trailing, equalTo: safeArea, attribute: .trailing, constant: -24)
            .make(.top, equalTo: safeArea, attribute: .top, constant: 16)
        
        nameLabel
            .make(.leading, equalTo: safeArea, attribute: .leading, constant: 24)
            .make(.trailing, equalTo: safeArea, attribute: .trailing, constant: -24)
            .make(.top, equalTo: detailImageView, attribute: .bottom, constant: 16)
        
        // Foi adicionado uma nova constraint da detailImageView 
        // (height lessThanEqualTo safeArea height multipliedBy 0.7)
        // e a constraint de height da detailImageView foi modificada para lessThanOrEqualTo.
        // Essa ação foi feita porque, com as constraints apresentadas no storyboard, para telas pequenas,
        // feito o iPod touch (7th generation), no modo Panorama, o nameLabel não aparecia
        // Então foi-se colocado para limitar a escala da detailImage view se estiver ocupando muito.
    }
    
    func reloadName(_ name: String) {
        self.nameLabel.text = name
    }
    
    func reloadImage(_ image: UIImage) {
        self.detailImageView.image = image
    }
    
}
