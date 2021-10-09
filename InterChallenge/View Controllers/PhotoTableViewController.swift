import Alamofire
import UIKit

class PhotoTableViewController: ItemsTableViewController<PhotoTableViewCell, Photo>{
    
    var userName = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Fotos de \(userName)"
    }

    override func selectionFunction(item: Photo){
        let vc = DetailsViewController()
        vc.configure(photo: item)
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

