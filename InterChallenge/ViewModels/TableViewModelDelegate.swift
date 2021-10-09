//
//  fillDataDelegate.swift
//  InterChallenge
//
//  Created by Samuel Brasileiro on 08/10/21.
//

import UIKit

protocol TableViewModelDelegate{
    associatedtype T where T: Codable
    
    var viewModel: TableViewModel<T> {get set}
    
    func fillData(url: String)
}

extension TableViewModelDelegate where Self: UITableViewController{
    
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
}
