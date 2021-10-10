import Alamofire
import UIKit

class PostTableViewController: ItemsTableViewController<Post, TitleAndDescriptionTableViewCell<Post>> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Postagens de \(self.viewModel.username)"
    }
    
    override func selectionFunction(item: Post) {
        
//        coordinator?.showItemsTableView(itemId: item.uid, name: viewModel.username,
//                                        cellType: TitleAndDescriptionTableViewCell<Comment>.self)
        coordinator?.showComments(itemId: item.uid, name: viewModel.username)
    }
}
