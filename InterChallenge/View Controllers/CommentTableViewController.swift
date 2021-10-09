import Alamofire
import UIKit

class CommentTableViewController: ItemsTableViewController<TitleAndDescriptionTableViewCell, Comment>{
    
    var userName = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Comentários de \(userName)"
        
        
    }
}
