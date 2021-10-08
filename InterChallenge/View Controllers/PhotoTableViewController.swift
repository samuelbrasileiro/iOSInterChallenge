import Alamofire
import UIKit

class PhotoTableViewController: UIViewController, TableViewModelDelegate {
    
    typealias T = Photo
    
    var viewModel = TableViewModel<Photo>()
    
    var tableView = UITableView()

    var albumId = Int()
    var userName = String()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        navigationItem.title = "Fotos de \(userName)"
        
        tableView.register(PhotoTableViewCell.self, forCellReuseIdentifier: "PhotoCell")
        
        tableView.delegate = self
        tableView.dataSource = self
        
        self.configureTableView()
                
        self.fillData(url: "https://jsonplaceholder.typicode.com/photos?albumId=\(albumId)")
    }
    
}

extension  PhotoTableViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.items.count
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PhotoCell", for: indexPath) as? PhotoTableViewCell else {
            return UITableViewCell()
        }

        let photo = self.viewModel.items[indexPath.row]
        
        cell.configure(photo: photo)

        return cell
    }
    
   func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let photo = self.viewModel.items[indexPath.row]
    let vc = DetailsViewController()
    vc.configure(photo: photo)
    
    self.navigationController?.pushViewController(vc, animated: true)

   }

}
