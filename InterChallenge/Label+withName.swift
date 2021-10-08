//
//  Label+withName.swift
//  InterChallenge
//
//  Created by Samuel Brasileiro on 08/10/21.
//

import UIKit

extension UILabel{
    class func with(name: String, numberOfLines: Int = 0) -> UILabel {
        let label = UILabel()
        label.text = name
        label.numberOfLines = numberOfLines
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
}
