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
    
    func showItemsTableView<ItemType, CellType>(itemId: Int, name: String, cellType: CellType.Type)
    where CellType: GenericCell<ItemType>, ItemType: Codable {
        let viewController = ItemsTableViewController<ItemType, CellType>(itemId: itemId)
        
        viewController.setTitle(name: name)
        
        viewController.coordinator = self
        
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func showPosts(itemId: Int, name: String) {
        let viewController = PostTableViewController(itemId: itemId)
        
        viewController.setTitle(name: name)
        
        viewController.coordinator = self
        
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func showComments(itemId: Int, name: String) {
        let viewController = CommentTableViewController(itemId: itemId)
        
        viewController.setTitle(name: name)
        
        viewController.coordinator = self
        
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func showAlbums(itemId: Int, name: String) {
        let viewController = AlbumTableViewController(itemId: itemId)
        
        viewController.setTitle(name: name)
        
        viewController.coordinator = self
        
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func showPhotos(itemId: Int, name: String) {
        let viewController = PhotoTableViewController(itemId: itemId)
        
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
