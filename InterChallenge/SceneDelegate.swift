import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    
    var coordinator: MainCoordinator?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let window = UIWindow(windowScene: windowScene)
        
        let navigationController = UINavigationController()
        
        self.coordinator = MainCoordinator(navigationController: navigationController)
        self.coordinator?.start()
        
        window.rootViewController = navigationController
        self.window = window
        window.makeKeyAndVisible()
        
    }
}
