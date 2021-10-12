import Alamofire
import UIKit

class AlbumTableViewController: ItemTableViewController<Album, AlbumTableViewCell> {
    
    // MARK: - Initializers
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Álbuns de \(self.viewModel.getUsername())"
    }
    
    // MARK: - Methods
    override func selectionFunction(item: Album) {
        coordinator?.showPhotos(itemId: item.uid, name: self.viewModel.getUsername())
    }
}
