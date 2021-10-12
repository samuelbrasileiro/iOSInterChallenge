//
//  APIService.swift
//  InterChallenge
//
//  Created by Samuel Brasileiro on 10/10/21.
//

import Alamofire
import UIKit

/// A class that handles API calls from URLs
protocol GenericAPIService {
    associatedtype ItemType: Codable
    
    func fetchData(from url: String, completion: @escaping (Result<ItemType, Error>) -> Void)
    func downloadImage(from url: String, completion: @escaping (Result<UIImage, Error>) -> Void)
}

/// A class that handles API calls from AlamoFire URLs
class APIService<ItemType: Codable>: GenericAPIService {
    
    func fetchData(from url: String, completion: @escaping (Result<ItemType, Error>) -> Void) {
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
    
}
