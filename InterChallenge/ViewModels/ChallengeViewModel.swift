//
//  ChallengeViewModel.swift
//  InterChallenge
//
//  Created by Samuel Brasileiro on 08/10/21.
//

import SwiftUI
import Alamofire

protocol TableViewConfiguration{
    
}

protocol TableViewModelDelegate{
    associatedtype T where T: Codable
    
    var tableView: UITableView {get set}
    var viewModel: FillViewModel<T> {get set}
    
    func fillData(url: String)
    func configureTableView()
}

extension TableViewModelDelegate where Self: UIViewController, Self: UITableViewDelegate{
    
    func fillData(url: String){
        viewModel.fillItems(url: url){  [weak self] result in
            guard let self = self else { return }
            
            if case .success(_) = result {
                self.tableView.reloadData()
            }
            else{
                let alert = UIAlertController(title: "Erro", message: "Algo errado aconteceu. Tente novamente mais tarde.", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { _ in
                    alert.dismiss(animated: true)
                }))
                self.present(alert, animated: true)
            }
        }
    }
    
    func configureTableView(){
        tableView.translatesAutoresizingMaskIntoConstraints = false

        tableView.estimatedRowHeight = 233
        tableView.rowHeight = UITableView.automaticDimension
        
        self.view.addSubview(tableView)
        
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true

    }
}

class FillViewModel<T>
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
