import Alamofire
import UIKit

class PhotoTableViewController: ItemTableViewController<Photo, PhotoTableViewCell> {
    
    // MARK: - Initializers
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Fotos de \(self.viewModel.getUsername())"
    }
    
    // MARK: - Methods
    override func cellConfigurationCompletion(cell: PhotoTableViewCell, at row: Int) {
        self.viewModel.downloadImage(for: cell.photoImageView, at: row)
    }
    
    override func selectionFunction(item: Photo) {
        coordinator?.showDetails(photo: item)
    }
}
