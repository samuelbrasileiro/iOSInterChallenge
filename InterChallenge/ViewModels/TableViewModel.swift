//
//  ChallengeViewModel.swift
//  InterChallenge
//
//  Created by Samuel Brasileiro on 08/10/21.
//

import SwiftUI
import Alamofire

/// A ViewModel for a TableView with generic codable type of items
protocol GenericTableViewModel {
    associatedtype ItemType
    
    var items: [ItemType] {get}
    
    var cellIdentifier: String {get}
    
    /// This function access an API to get data
    /// - Parameter completion: Handle an error response from the call
    func fillData(completion: @escaping (Error?) -> Void)
    
    func getItemsCount() -> Int
    func getItem(at index: Int) -> ItemType?
    func getCellIdentifier() -> String
    
}

class TableViewModel<ItemType: Codable>: GenericTableViewModel {
    
    private let apiService = APIService<[ItemType]>()
    
    var items: [ItemType] = []
    var cellIdentifier: String = "MainCell"
    
    private var url: String = ""
    private var username: String = ""
    
    func fillData(completion: @escaping (Error?) -> Void) {
        
        apiService.fetchData(from: url) { [weak self] result in
            if case .success(let items) = result {
                self?.items = items
                
                completion(nil)
                
            } else if case .failure(let error) = result {
                completion(error)
            }
        }
    }
    
    func setURL(itemId: Int? = nil) {
        var idText = ""
        if let itemId = itemId {
            idText = String(itemId)
        }
        
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
    
    func setUsername(name: String) {
        self.username = name
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
