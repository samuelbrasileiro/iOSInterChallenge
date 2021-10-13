import UIKit

extension UILabel {
    /// This function creates a pre-configured label
    /// - Parameters:
    ///   - text: The label's initial text
    ///   - numberOfLines: The number of lines of the label
    ///   - fontSize: The size of the label's font
    /// - Returns: An UILabel with the selected settings
    class func with(text: String, numberOfLines: Int = 0, fontSize: CGFloat = 17, 
                    alignment: NSTextAlignment = .natural) -> UILabel {
        let label = UILabel()
        label.text = text
        label.textAlignment = alignment
        label.numberOfLines = numberOfLines
        label.font = label.font.withSize(fontSize)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
}
