//
//  ChallengeViewModel.swift
//  InterChallenge
//
//  Created by Samuel Brasileiro on 08/10/21.
//

import SwiftUI
import Alamofire

class TableViewModel<T>
where T: Codable{
    var items: [T] = []
    
    var url: String = ""
    
    var cellIdentifier: String = "MainCell"
    
    init(){
    }
    
    func fillItems(completion: @escaping (Result<HTTPURLResponse, Error>) -> Void) {
        
        AF.request(url).validate().responseJSON { response in
            guard response.error == nil else {
                
                completion(.failure(response.error!.underlyingError!))//checar isso
                return
            }
            
            do {
                if let data = response.data {
                    let models = try JSONDecoder().decode([T].self, from: data)
                    self.items = models
                    //self.tableView.reloadData()
                    completion(.success(response.response!))
                }
            } catch {
                print("Error during JSON serialization: \(error.localizedDescription)")
                completion(.failure(error))
            }
        }
    }
    
    func setURL(id: Int? = nil) {
        var url = ""
        if let id = id {
            
            switch T.self {
            case is Post.Type:
                url = "https://jsonplaceholder.typicode.com/posts?userId=\(id)"
            case is Comment.Type:
                url = "https://jsonplaceholder.typicode.com/comments?postId=\(id)"
            case is Album.Type:
                url = "https://jsonplaceholder.typicode.com/albums?userId=\(id)"
            case is Photo.Type:
                url = "https://jsonplaceholder.typicode.com/photos?albumId=\(id)"
            default:
                url = ""
            }
        }
        else {
            switch T.self {
            case is User.Type:
                url = "https://jsonplaceholder.typicode.com/users"
            default:
                url = ""
            }
        }
        self.url = url
    }
    
}
