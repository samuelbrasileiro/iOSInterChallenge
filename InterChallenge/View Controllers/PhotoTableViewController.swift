import Alamofire
import UIKit

class PhotoTableViewController: ItemsTableViewController<Photo, PhotoTableViewCell> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Fotos de \(self.viewModel.getUsername())"
    }
    
    override func selectionFunction(item: Photo) {
        coordinator?.showDetails(photo: item)
    }
}
