import Alamofire
import UIKit

class AlbumTableViewController: ItemsTableViewController<AlbumTableViewCell, Album>{
    
    var userName = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Álbuns de \(userName)"
        
    }
    
    override func selectionFunction(item: Album){
        let vc = PhotoTableViewController(url: "https://jsonplaceholder.typicode.com/photos?albumId=\(item.id)", cellIdentifier: "PhotoCell")
        vc.userName = self.userName
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    
    
}
