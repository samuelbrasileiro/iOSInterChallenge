//
//  Coordinator.swift
//  InterChallenge
//
//  Created by Samuel Brasileiro on 08/10/21.
//

import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    
    func start()
}

class MainCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = ChallengeViewController()
        viewController.coordinator = self
        navigationController.pushViewController(viewController, animated: false)
    }
    
    func showItemsTableView<CellType, ItemType>(itemId: Int, name: String, 
                                                cellType: CellType.Type, itemType: ItemType.Type)
    where CellType: UITableViewCell, CellType: ConfigurableCell, ItemType: Codable {
        
        let viewController = ItemsTableViewController<CellType, ItemType>(itemId: itemId)
        
        viewController.setTitle(name: name)
        
        viewController.coordinator = self
        
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func showDetails(photo: Photo) {
        let viewController = DetailsViewController()
        
        viewController.configure(photo: photo)
        viewController.coodinator = self
        
        navigationController.pushViewController(viewController, animated: true)
    }
}
