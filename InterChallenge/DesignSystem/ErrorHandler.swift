//
//  ErrorHandler.swift
//  InterChallenge
//
//  Created by Samuel Brasileiro on 11/10/21.
//

import UIKit

protocol ErrorHandler: AnyObject {
    /// This function handles an error message
    /// - Parameter error: Error to be handled
    func handleError(error: Error)
}

extension ErrorHandler where Self: UIViewController {
    /// This function presents an alert containing an error message 
    /// - Parameter error: Error to be handled
    func handleError(error: Error) {
        let alert = UIAlertController(title: "Error",
                                      message: error.localizedDescription,
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { _ in
            alert.dismiss(animated: true)
        }))
        self.present(alert, animated: true)
    }
}
