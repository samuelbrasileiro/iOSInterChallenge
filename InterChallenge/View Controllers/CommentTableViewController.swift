import Alamofire
import UIKit

class CommentTableViewController: ItemsTableViewController<Comment, TitleAndDescriptionTableViewCell<Comment>> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Comentários de \(self.viewModel.getUsername())"
    }
    
    override func cellConfigurationCompletion(cell: TitleAndDescriptionTableViewCell<Comment>, at cellRow: Int) {
        cell.selectionStyle = .none
    }
}
