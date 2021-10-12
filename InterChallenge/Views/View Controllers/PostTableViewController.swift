import Alamofire
import UIKit

class PostTableViewController: ItemTableViewController<Post, TitleAndDescriptionTableViewCell<Post>> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Postagens de \(self.viewModel.getUsername())"
    }
    
    override func selectionFunction(item: Post) {
        coordinator?.showComments(itemId: item.uid, name: viewModel.getUsername())
    }
}
