//
//  APIService.swift
//  InterChallenge
//
//  Created by Samuel Brasileiro on 10/10/21.
//

import Alamofire
import UIKit

class APIService<ItemType: Codable> {
    
    func fetchData(from url: String, completion: @escaping (Result<ItemType, AFError>) -> Void) {
        AF.request(url).validate().responseJSON { response in
            guard response.error == nil else {
                completion(.failure(response.error!))
                return
            }
            do {
                if let data = response.data {
                    let models = try JSONDecoder().decode(ItemType.self, from: data)

                    completion(.success(models))
                }
            } catch {
                completion(.failure(error.asAFError(
                                        orFailWith: "Error during JSON serialization: \(error.localizedDescription)")))
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
    
}
