import UIKit

/// A Coordinator handles the navigation of controllers
protocol Coordinator {
    /// The child coordinators of a coordinator
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    
    /// This function initiates the coordinator navigation
    func start()
}

/// The main coordinator that will handle the navigation of the app
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

    func showPosts(itemId: Int, name: String) {
        let viewController = PostTableViewController(itemId: itemId)
        showViewController(viewController, name: name)
    }
    
    func showComments(itemId: Int, name: String) {
        let viewController = CommentTableViewController(itemId: itemId)
        showViewController(viewController, name: name)
    }
    
    func showAlbums(itemId: Int, name: String) {
        let viewController = AlbumTableViewController(itemId: itemId)
        showViewController(viewController, name: name)
    }
    
    func showPhotos(itemId: Int, name: String) {
        let viewController = PhotoTableViewController(itemId: itemId)
        showViewController(viewController, name: name)
    }
    
    func showDetails(photo: Photo) {
        let viewController = DetailsViewController()
        viewController.configure(photo: photo)
        viewController.coodinator = self
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func showViewController<ItemType, CellType>(_ viewController: ItemTableViewController<ItemType, CellType>,
                                                name: String) {
        viewController.coordinator = self
        viewController.setTitle(name: name)
        navigationController.pushViewController(viewController, animated: true)
    }
}
