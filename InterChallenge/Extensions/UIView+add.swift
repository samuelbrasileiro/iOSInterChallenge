import UIKit

public extension UIView {
    @discardableResult
    func add(subview: UIView) -> Self {
        self.addSubview(subview)
        return self
    }
}
