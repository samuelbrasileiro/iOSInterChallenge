import Alamofire
import UIKit

class CommentTableViewController: UIViewController, TableViewModelDelegate {
    
    typealias T = Comment
    
    var viewModel = FillViewModel<Comment>()
    
    var tableView = UITableView()
    
    var postId = Int()
    var userName = String()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        navigationItem.title = "Comentários de \(userName)"
        
        tableView.register(TitleAndDescriptionTableViewCell.self,
                           forCellReuseIdentifier: "TitleAndDescriptionCell")
        
        tableView.delegate = self
        tableView.dataSource = self
        
        self.configureTableView()
                
        self.fillData(url: "https://jsonplaceholder.typicode.com/comments?postId=\(postId)")
    }
    
}
extension  CommentTableViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TitleAndDescriptionCell", for: indexPath) as? TitleAndDescriptionTableViewCell else {
            return UITableViewCell()
        }
        
        let comment = self.viewModel.items[indexPath.row]
        cell.selectionStyle = .none
        cell.titleLabel.text = comment.name
        cell.descriptionLabel.text = comment.body
        
        return cell
    }
}
