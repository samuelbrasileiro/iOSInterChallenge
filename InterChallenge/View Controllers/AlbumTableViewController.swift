import Alamofire
import UIKit

class AlbumTableViewController: ItemsTableViewController<AlbumTableViewCell, Album> {
    var userName = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Álbuns de \(userName)"
    }
    
    override func selectionFunction(item: Album) {
        coordinator?.showItemsTableView(itemId: item.uid, name: userName,
                                        cellType: PhotoTableViewCell.self, itemType: Photo.self)
    }
}
