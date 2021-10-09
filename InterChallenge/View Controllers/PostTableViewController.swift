import Alamofire
import UIKit

class PostTableViewController: ItemsTableViewController<TitleAndDescriptionTableViewCell,Post> {

    var userName = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Postagens de \(userName)"
        
    }
    
    override func selectionFunction(item: Post){
        
        let vc = CommentTableViewController(url: "https://jsonplaceholder.typicode.com/comments?postId=\(item.id)", cellIdentifier: "CommentCell")
        vc.userName = self.userName
        
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
}
