import Alamofire
import UIKit

protocol DetailsViewModelDelegate: AnyObject {
    
    func reloadName(_ name: String)
    func reloadImage(_ image: UIImage)
}

class DetailsViewModel {
    
    // MARK: - Attributes
    weak var delegate: DetailsViewModelDelegate?
    weak var errorHandler: ErrorHandler?
    
    var apiService = APIService<Photo>()
    
    // MARK: - Methods
    func configure(photo: Photo) {

        delegate?.reloadName(photo.title)
        
        apiService.downloadImage(from: photo.url) { [weak self] result in
            if case .success(let image) = result {
                self?.delegate?.reloadImage(image) // ARC
            } else if case .failure(let error) = result {
                self?.errorHandler?.handle(error: error)
            }
        }
    }
}
