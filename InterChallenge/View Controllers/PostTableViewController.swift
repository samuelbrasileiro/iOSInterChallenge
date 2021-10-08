import Alamofire
import UIKit

class PostTableViewController: UIViewController, TableViewModelDelegate {
    typealias T = Post
    
    
    var userId = Int()
    var userName = String()
    
    var tableView = UITableView()
    
    var viewModel = TableViewModel<Post>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        
        navigationItem.title = "Postagens de \(userName)"
        tableView.register(TitleAndDescriptionTableViewCell.self, forCellReuseIdentifier: "TitleAndDescriptionCell")
        
        tableView.delegate = self
        tableView.dataSource = self
        
        self.configureTableView()
        
        self.fillData(url: "https://jsonplaceholder.typicode.com/posts?userId=\(userId)")
    }
    

}

extension  PostTableViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.items.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TitleAndDescriptionCell", for: indexPath) as? TitleAndDescriptionTableViewCell else {
            return UITableViewCell()
        }
        
        let post = viewModel.items[indexPath.row]
        cell.configure(title: post.title, description: post.body)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let postId = viewModel.items[indexPath.row].id
        
        let vc = CommentTableViewController()
        vc.userName = self.userName
        vc.postId = postId
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
}
