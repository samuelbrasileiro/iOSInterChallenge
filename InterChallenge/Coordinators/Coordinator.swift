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
        let vc = ChallengeViewController(url: "https://jsonplaceholder.typicode.com/users", cellIdentifier: "ChallengeCell")
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
    }
    
    func showPosts(id: Int, name: String) {
        let vc = PostTableViewController(url: "https://jsonplaceholder.typicode.com/posts?userId=\(id)", cellIdentifier: "PostCell")
        vc.userName = name
        
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func showComments(id: Int, name: String) {
        let vc = CommentTableViewController(url: "https://jsonplaceholder.typicode.com/comments?postId=\(id)", cellIdentifier: "CommentCell")
        vc.userName = name
        
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func showAlbums(id: Int, name: String) {
        
        let vc = AlbumTableViewController(url: "https://jsonplaceholder.typicode.com/albums?userId=\(id)", cellIdentifier: "AlbumCell")
        vc.userName = name
        
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
        
    }
    
    func showPhotos(id: Int, name: String) {
        let vc = PhotoTableViewController(url: "https://jsonplaceholder.typicode.com/photos?albumId=\(id)", cellIdentifier: "PhotoCell")
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
