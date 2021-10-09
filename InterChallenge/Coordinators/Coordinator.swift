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
        let vc = ChallengeViewController()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
    }
    
//    func showItemsTableView<T: ItemsTableViewController>(id: Int, name: String){
//
//    }
//
    
    func showPosts(id: Int, name: String) {
        let vc = PostTableViewController(id: id)
        vc.userName = name
        
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func showComments(id: Int, name: String) {
        let vc = CommentTableViewController(id: id)
        vc.userName = name
        
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func showAlbums(id: Int, name: String) {
        
        let vc = AlbumTableViewController(id: id)
        vc.userName = name
        
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
        
    }
    
    func showPhotos(id: Int, name: String) {
        let vc = PhotoTableViewController(id: id)
        vc.userName = name
        
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func showDetails(photo: Photo) {
        let vc = DetailsViewController()
        vc.configure(photo: photo)
        
        vc.coodinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
}
