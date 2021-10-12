import Alamofire
import UIKit

class CommentTableViewController: ItemTableViewController<Comment, TitleAndDescriptionTableViewCell<Comment>> {
    
    // MARK: - Initializers
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Comentários de \(self.viewModel.getUsername())"
    }
    
    // MARK: - Methods
    override func cellConfigurationCompletion(cell: TitleAndDescriptionTableViewCell<Comment>, at row: Int) {
        cell.selectionStyle = .none
    }
}
