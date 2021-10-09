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
//    func showItemsTableView<T: ItemsTableViewController>(id: Int, name: String){
//
//    }
//
    func showPosts(itemId: Int, name: String) {
        let viewController = PostTableViewController(itemId: itemId)
        viewController.userName = name
        viewController.coordinator = self
        navigationController.pushViewController(viewController, animated: true)
    }
    func showComments(itemId: Int, name: String) {
        let viewController = CommentTableViewController(itemId: itemId)
        viewController.userName = name
        viewController.coordinator = self
        navigationController.pushViewController(viewController, animated: true)
    }
    func showAlbums(itemId: Int, name: String) {
        let viewController = AlbumTableViewController(itemId: itemId)
        viewController.userName = name
        viewController.coordinator = self
        navigationController.pushViewController(viewController, animated: true)
    }
    func showPhotos(itemId: Int, name: String) {
        let viewController = PhotoTableViewController(itemId: itemId)
        viewController.userName = name
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
