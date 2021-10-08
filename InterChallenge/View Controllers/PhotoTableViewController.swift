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
        cell.titleLabel.text = photo.title

        AF.download(photo.thumbnailUrl).responseData { response in
            switch response.result {
            case .success(let data):
                cell.photoImageView.image = UIImage(data: data)
            default:
                break
            }
        }
        
        return cell
    }
    
   func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let photo = self.viewModel.items[indexPath.row]
        
        AF.download(photo.url).responseData { response in
            switch response.result {
            case .success(let data):
                let vc = DetailsViewController()
                vc.name = photo.title
                if let photo = UIImage(data: data){
                    vc.photo = photo
                }
                self.navigationController?.pushViewController(vc, animated: true)
                
            default:
                break
            }
        }
    }

}
