import Alamofire
import UIKit

class AlbumTableViewController: ItemsTableViewController<Album, AlbumTableViewCell> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Álbuns de \(self.viewModel.username)"
    }
    
    override func selectionFunction(item: Album) {
//        coordinator?.showItemsTableView(itemId: item.uid, name: self.viewModel.username,
//                                        cellType: PhotoTableViewCell.self)
        coordinator?.showPhotos(itemId: item.uid, name: self.viewModel.username)
    }
}
