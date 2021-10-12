import Alamofire
import UIKit

class ChallengeViewController: ItemsTableViewController<User, UserTableViewCell> { 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Desafio"
    }
    
    override func cellConfigurationCompletion(cell: UserTableViewCell, at row: Int) {
        cell.delegate = self
        
        cell.contentView.backgroundColor = row % 2 == 0 ? .systemBackground : .systemGray6
    }
}

extension ChallengeViewController: UserTableViewCellDelegate {
    func didTapAlbums(with userId: Int, by name: String) {
        coordinator?.showAlbums(itemId: userId, name: name)
    }
    
    func didTapPosts(with userId: Int, by name: String) {
        coordinator?.showPosts(itemId: userId, name: name)
    }
}
