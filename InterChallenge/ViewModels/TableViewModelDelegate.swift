//
//  fillDataDelegate.swift
//  InterChallenge
//
//  Created by Samuel Brasileiro on 08/10/21.
//

import UIKit

protocol TableViewModelDelegate{
    associatedtype T where T: Codable
    
    var tableView: UITableView {get set}
    var viewModel: TableViewModel<T> {get set}
    
    func fillData(url: String)
    func configureTableView()
}

extension TableViewModelDelegate where Self: UIViewController{
    
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
