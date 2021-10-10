import Alamofire
import UIKit

class ChallengeViewController: ItemsTableViewController<UserTableViewCell, User> {
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
        coordinator?.showAlbums(itemId: userId, name: name)
    }
    
    func didTapPosts(with userId: Int, by name: String) {
        coordinator?.showPosts(itemId: userId, name: name)
    }
}
