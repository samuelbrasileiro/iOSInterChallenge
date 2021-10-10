//
//  ChallengeViewModel.swift
//  InterChallenge
//
//  Created by Samuel Brasileiro on 08/10/21.
//

import SwiftUI
import Alamofire

class TableViewModel<ItemType: Codable> {
    
    var items: [ItemType] = []
    
    var url: String = ""
    var username: String = ""
    var cellIdentifier: String = "MainCell"
    
    init() {
        
    }
    
    func fillItems(completion: @escaping (Result<HTTPURLResponse?, Error>) -> Void) {
        AF.request(url).validate().responseJSON { response in
            guard response.error == nil else {
                completion(.failure(response.error!.underlyingError!)) // checar isso
                return
            }
            do {
                if let data = response.data {
                    let models = try JSONDecoder().decode([ItemType].self, from: data)
                    self.items = models

                    completion(.success(response.response!))
                }
            } catch {
                print("Error during JSON serialization: \(error.localizedDescription)")
                completion(.failure(error))
            }
        }
    }
    
    func setURL(itemId: Int? = nil) {
        var url = ""
        
        if let itemId = itemId { // Tipos com ID
            switch ItemType.self {
            case is Post.Type:
                url = "https://jsonplaceholder.typicode.com/posts?userId=\(itemId)"
            case is Comment.Type:
                url = "https://jsonplaceholder.typicode.com/comments?postId=\(itemId)"
            case is Album.Type:
                url = "https://jsonplaceholder.typicode.com/albums?userId=\(itemId)"
            case is Photo.Type:
                url = "https://jsonplaceholder.typicode.com/photos?albumId=\(itemId)"
            default:
                url = ""
            }
        } else {
            switch ItemType.self { // Tipos sem ID
            case is User.Type:
                url = "https://jsonplaceholder.typicode.com/users"
            default:
                url = ""
            }
        }
        self.url = url
    }
    
    func setUsername(name: String) {
        self.username = name
    }
}
