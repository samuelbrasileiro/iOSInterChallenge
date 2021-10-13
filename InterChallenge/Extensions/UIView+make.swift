import UIKit

public extension UIView {
    @discardableResult
    func make(_ anchor: NSLayoutConstraint.Attribute, equalTo item: Any?, 
              attribute: NSLayoutConstraint.Attribute? = nil, multipliedBy: CGFloat = 1.0, 
              constant: CGFloat = 0.0) -> Self {
        NSLayoutConstraint(item: self, attribute: anchor, relatedBy: .equal, 
                           toItem: item, attribute: attribute ?? anchor, 
                           multiplier: multipliedBy, constant: constant).isActive = true
        return self
    }
    
    @discardableResult
    func make(_ anchor: NSLayoutConstraint.Attribute, lessThanOrEqualTo item: Any?, 
              attribute: NSLayoutConstraint.Attribute? = nil, multipliedBy: CGFloat = 1.0, 
              constant: CGFloat = 0.0) -> Self {
        NSLayoutConstraint(item: self, attribute: anchor, relatedBy: .lessThanOrEqual, 
                           toItem: item, attribute: attribute ?? anchor, multiplier: multipliedBy, 
                           constant: constant).isActive = true
        return self
    }
    
    @discardableResult
    func make(_ anchor: NSLayoutConstraint.Attribute, greaterThanOrEqualTo item: Any?, 
              attribute: NSLayoutConstraint.Attribute? = nil, multipliedBy: CGFloat = 1.0, 
              constant: CGFloat = 0.0) -> Self {
        NSLayoutConstraint(item: self, attribute: anchor, relatedBy: .greaterThanOrEqual, 
                           toItem: item, attribute: attribute ?? anchor, multiplier: multipliedBy, 
                           constant: constant).isActive = true
        return self
    }
}
