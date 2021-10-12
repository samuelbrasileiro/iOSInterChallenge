import Alamofire
import UIKit

class PostTableViewController: ItemTableViewController<Post, TitleAndDescriptionTableViewCell<Post>> {
    
    // MARK: - Initializers
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Postagens de \(self.viewModel.getUsername())"
    }
    
    // MARK: - Methods
    override func selectionFunction(item: Post) {
        coordinator?.showComments(itemId: item.uid, name: viewModel.getUsername())
    }
}
