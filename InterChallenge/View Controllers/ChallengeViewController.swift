import Alamofire
import UIKit

class ChallengeViewController: UIViewController, TableViewModelDelegate {
    
    typealias T = User
    
    var viewModel = TableViewModel<User>()
    
    var tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        self.title = "Desafio"
        
        tableView.register(UserTableViewCell.self, forCellReuseIdentifier: "UserCell")
        
        tableView.dataSource = self
        tableView.delegate = self
        
        self.configureTableView()
        
        self.fillData(url: "https://jsonplaceholder.typicode.com/users")
        
    }
    
    
}

extension  ChallengeViewController: UITableViewDelegate, UITableViewDataSource{
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.items.count
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath) as? UserTableViewCell else {
            return UITableViewCell()
        }
        let user = viewModel.items[indexPath.row]
        cell.selectionStyle = .none
        cell.id = user.id
        cell.initialsLabel.text = String(user.name.prefix(2))
        cell.nameLabel.text = user.name
        cell.userNameLabel.text = user.username
        cell.emailLabel.text = user.email
        cell.phoneLabel.text = user.phone
        cell.delegate = self
        cell.contentView.backgroundColor = indexPath.row % 2 == 0 ? .systemBackground : .systemGray6
        return cell
    }
    
}

extension ChallengeViewController: UserTableViewCellDelegate {
    func didTapAlbums(with userId: Int, by name: String) {
        
        let vc = AlbumTableViewController()
        vc.userId = userId
        vc.userName = name
        self.navigationController?.pushViewController(vc, animated: true)

    }
    
    func didTapPosts(with userId: Int, by name: String) {
        
        let vc = PostTableViewController()
        vc.userId = userId
        vc.userName = name
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
