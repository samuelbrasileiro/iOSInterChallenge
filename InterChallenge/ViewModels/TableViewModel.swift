//
//  ChallengeViewModel.swift
//  InterChallenge
//
//  Created by Samuel Brasileiro on 08/10/21.
//

import SwiftUI
import Alamofire

class TableViewModel<ItemType: Codable> {
    
    private let apiService = APIService<[ItemType]>()
    
    private var items: [ItemType] = []
    
    private var url: String = ""
    private var username: String = ""
    private var cellIdentifier: String = "MainCell"
    
    init() {
        
    }
    
    func fetchItemsFromAPI(completion: @escaping (Error?) -> Void) {
        
        apiService.fetchData(from: url) { result in
            if case .success(let items) = result {
                self.items = items
                
                completion(nil)
                
            } else if case .failure(let error) = result {
                completion(error)
            }
        }
    }
    
    func setUsername(name: String) {
        self.username = name
    }
    
    func setURL(itemId: Int? = nil) {
        
        let idText = itemId == nil ? "" : String(itemId!)
        
        switch ItemType.self {
        case is User.Type:
            url = "https://jsonplaceholder.typicode.com/users"
        case is Post.Type:
            url = "https://jsonplaceholder.typicode.com/posts?userId=\(idText)"
        case is Comment.Type:
            url = "https://jsonplaceholder.typicode.com/comments?postId=\(idText)"
        case is Album.Type:
            url = "https://jsonplaceholder.typicode.com/albums?userId=\(idText)"
        case is Photo.Type:
            url = "https://jsonplaceholder.typicode.com/photos?albumId=\(idText)"
        default:
            url = ""
        }
    }
    
    func getUsername() -> String {
        return self.username
    }
    
    func getCellIdentifier() -> String {
        return self.cellIdentifier
    }
    
    func getItemsCount() -> Int {
        return items.count
    }
    
    func getItem(at index: Int) -> ItemType? {
        if index < items.count {
            return items[index]
        }
        return nil
    }
}
