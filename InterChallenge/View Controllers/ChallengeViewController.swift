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
        coordinator?.showItemsTableView(itemId: userId, name: name,
                                        cellType: AlbumTableViewCell.self, itemType: Album.self)
    }
    
    func didTapPosts(with userId: Int, by name: String) {
        coordinator?.showItemsTableView(itemId: userId, name: name,
                                        cellType: TitleAndDescriptionTableViewCell.self, itemType: Post.self)
    }
}
