//
//  ErrorHandler.swift
//  InterChallenge
//
//  Created by Samuel Brasileiro on 11/10/21.
//

import UIKit

protocol ErrorHandler: AnyObject {
    func handleError(error: Error)
}

extension ErrorHandler where Self: UIViewController {
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
