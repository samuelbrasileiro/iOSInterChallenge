import Alamofire
import UIKit

/// A class that handles API calls from URLs
protocol GenericAPIService {
    associatedtype ItemType: Codable
    
    var url: String {get set}
    
    func setURL(itemId: Int?)
    func fetchData(completion: @escaping (Result<ItemType, Error>) -> Void)
    func downloadImage(from url: String, completion: @escaping (Result<UIImage, Error>) -> Void)
}

/// A class that handles API calls from AlamoFire URLs
class APIService<ItemType: Codable>: GenericAPIService {
    var url: String = ""
    
    func fetchData(completion: @escaping (Result<ItemType, Error>) -> Void) {
        AF.request(url).validate().responseJSON { response in
            if let error = response.error {
                completion(.failure(error))
                return
            }
            
            do {
                if let data = response.data {
                    let model = try JSONDecoder().decode(ItemType.self, from: data)
                    completion(.success(model))
                }
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    func downloadImage(from url: String, completion: @escaping (Result<UIImage, Error>) -> Void) {
        AF.download(url).responseData { response in
            
            switch response.result {
            case .success(let data):
                if let image = UIImage(data: data) {
                    completion(.success(image))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func setURL(itemId: Int?) {
        var idText = ""
        if let itemId = itemId {
            idText = String(itemId)
        }
        
        switch ItemType.self {
        case is [User].Type:
            url = "https://jsonplaceholder.typicode.com/users"
        case is [Post].Type:
            url = "https://jsonplaceholder.typicode.com/posts?userId=\(idText)"
        case is [Comment].Type:
            url = "https://jsonplaceholder.typicode.com/comments?postId=\(idText)"
        case is [Album].Type:
            url = "https://jsonplaceholder.typicode.com/albums?userId=\(idText)"
        case is [Photo].Type:
            url = "https://jsonplaceholder.typicode.com/photos?albumId=\(idText)"
        default:
            url = ""
        }
    }
    
}
