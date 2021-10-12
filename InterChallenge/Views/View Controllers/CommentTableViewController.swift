import Alamofire
import UIKit

class CommentTableViewController: ItemTableViewController<Comment, TitleAndDescriptionTableViewCell<Comment>> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Comentários de \(self.viewModel.getUsername())"
    }
    
    override func cellConfigurationCompletion(cell: TitleAndDescriptionTableViewCell<Comment>, at row: Int) {
        cell.selectionStyle = .none
    }
}
