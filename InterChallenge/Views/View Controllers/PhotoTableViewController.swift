import Alamofire
import UIKit

class PhotoTableViewController: ItemTableViewController<Photo, PhotoTableViewCell> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Fotos de \(self.viewModel.getUsername())"
    }
    
    override func selectionFunction(item: Photo) {
        coordinator?.showDetails(photo: item)
    }
}
