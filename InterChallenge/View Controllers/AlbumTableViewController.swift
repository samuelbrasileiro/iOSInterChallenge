import Alamofire
import UIKit

class AlbumTableViewController: UIViewController, TableViewModelDelegate {
    
    typealias T = Album
    
    var viewModel = TableViewModel<Album>()
    
    var tableView = UITableView()

    var userId = Int()
    var userName = String()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        navigationItem.title = "Álbuns de \(userName)"
        
        tableView.register(AlbumTableViewCell.self, forCellReuseIdentifier: "AlbumCell")
        
        tableView.delegate = self
        tableView.dataSource = self
        
        self.configureTableView()
                
        self.fillData(url: "https://jsonplaceholder.typicode.com/albums?userId=\(userId)")
    }
    
}
extension  AlbumTableViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.items.count
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "AlbumCell", for: indexPath) as? AlbumTableViewCell else {
            return UITableViewCell()
        }

        let album = self.viewModel.items[indexPath.row]
        cell.albumNameLabel.text = album.title

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let albumId = self.viewModel.items[indexPath.row].id
        
        let vc = PhotoTableViewController()
        vc.userName = self.userName
        vc.albumId = albumId
        self.navigationController?.pushViewController(vc, animated: true)
        
    }

}
