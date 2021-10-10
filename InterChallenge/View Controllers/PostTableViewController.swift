import Alamofire
import UIKit

class PostTableViewController: ItemsTableViewController<TitleAndDescriptionTableViewCell, Post> {
    var userName = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Postagens de \(userName)"
    }
    
    override func selectionFunction(item: Post) {
        coordinator?.showItemsTableView(itemId: item.uid, name: userName,
                                        cellType: TitleAndDescriptionTableViewCell.self, itemType: Comment.self)
    }
}
