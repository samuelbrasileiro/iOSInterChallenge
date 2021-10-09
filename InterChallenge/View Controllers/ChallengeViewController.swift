import Alamofire
import UIKit

class ChallengeViewController: ItemsTableViewController<UserTableViewCell,User> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Desafio"
        
    }
    
    override func cellConfigurationCompletion(cell: UserTableViewCell, at cellRow: Int) {
        
        cell.delegate = self
        cell.contentView.backgroundColor = cellRow % 2 == 0 ? .systemBackground : .systemGray6
    }
    
}

extension ChallengeViewController: UserTableViewCellDelegate {
    func didTapAlbums(with userId: Int, by name: String) {
        
        let vc = AlbumTableViewController(url: "https://jsonplaceholder.typicode.com/albums?userId=\(userId)", cellIdentifier: "AlbumCell")
        vc.userName = name
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    func didTapPosts(with userId: Int, by name: String) {
        
        let vc = PostTableViewController(url: "https://jsonplaceholder.typicode.com/posts?userId=\(userId)", cellIdentifier: "PostCell")
        vc.userName = name
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
