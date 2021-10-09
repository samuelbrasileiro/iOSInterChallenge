import Alamofire
import UIKit

class PhotoTableViewController: ItemsTableViewController<PhotoTableViewCell, Photo> {
    var userName = String()
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Fotos de \(userName)"
    }
    override func selectionFunction(item: Photo) {
        coordinator?.showDetails(photo: item)
    }
}
