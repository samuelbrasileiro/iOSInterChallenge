import UIKit

protocol ErrorHandler: AnyObject {
    /// This function handles an error message
    /// - Parameter error: Error to be handled
    func handle(error: Error)
}

extension ErrorHandler where Self: UIViewController {
    /// This function presents an alert containing an error message 
    /// - Parameter error: Error to be handled
    func handle(error: Error) {
        print(error)
        let alert = UIAlertController(title: "Error",
                                      message: error.localizedDescription,
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default) { _ in
            alert.dismiss(animated: true)
        })
        self.present(alert, animated: true)
    }
}
