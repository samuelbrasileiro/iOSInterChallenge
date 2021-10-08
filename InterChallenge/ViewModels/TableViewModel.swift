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
    
    init(){
    }
    
    func fillItems(url: String, completion: @escaping (Result<HTTPURLResponse, Error>) -> Void) {
        
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
}
