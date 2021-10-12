//
//  UIView+Make.swift
//  InterChallenge
//
//  Created by Samuel Brasileiro on 12/10/21.
//

import UIKit

public extension UIView {
    @discardableResult
    func make(_ anchor: NSLayoutConstraint.Attribute, equalTo view: UIView, 
              attribute: NSLayoutConstraint.Attribute? = nil, multipliedBy: CGFloat = 1.0, 
              constant: CGFloat = 0.0) -> Self {
        NSLayoutConstraint(item: self, attribute: anchor, relatedBy: .equal, 
                           toItem: view, attribute: attribute ?? anchor, 
                           multiplier: multipliedBy, constant: constant).isActive = true
        return self
    }
    
    @discardableResult
    func make(_ anchor: NSLayoutConstraint.Attribute, lessThanOrEqual view: UIView, 
              attribute: NSLayoutConstraint.Attribute? = nil, multipliedBy: CGFloat = 1.0, 
              constant: CGFloat = 0.0) -> Self {
        NSLayoutConstraint(item: self, attribute: anchor, relatedBy: .lessThanOrEqual, 
                           toItem: view, attribute: attribute ?? anchor, multiplier: multipliedBy, 
                           constant: constant).isActive = true
        return self
    }
    
    @discardableResult
    func make(_ anchor: NSLayoutConstraint.Attribute, greaterThanOrEqual view: UIView, 
              attribute: NSLayoutConstraint.Attribute? = nil, multipliedBy: CGFloat = 1.0, 
              constant: CGFloat = 0.0) -> Self {
        NSLayoutConstraint(item: self, attribute: anchor, relatedBy: .greaterThanOrEqual, 
                           toItem: view, attribute: attribute ?? anchor, multiplier: multipliedBy, 
                           constant: constant).isActive = true
        return self
    }
}
