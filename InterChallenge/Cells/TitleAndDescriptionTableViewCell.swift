import UIKit

class TitleAndDescriptionTableViewCell: UITableViewCell, ConfigurableCell {
    func setData<T>(item: T) {
        if let item = item as? TitleAndDescription {
            self.titleLabel.text = item.title
            self.descriptionLabel.text = item.description
        }
    }
    let titleLabel = UILabel.with(name: "title")
    let descriptionLabel = UILabel.with(name: "description")
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
        setConstraints()
    }
    func configure() {
        self.contentView.addSubview(titleLabel)
        self.contentView.addSubview(descriptionLabel)
    }
    func setConstraints() {
        titleLabel.leadingAnchor.constraint(equalTo:
                                                self.contentView.leadingAnchor, constant: 16).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo:
                                                self.contentView.trailingAnchor, constant: -16).isActive = true
        titleLabel.topAnchor.constraint(equalTo:
                                            self.contentView.topAnchor, constant: 16).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo:
                                                    self.contentView.leadingAnchor, constant: 16).isActive = true
        descriptionLabel.trailingAnchor.constraint(equalTo:
                                                    self.contentView.trailingAnchor, constant: -16).isActive = true
        descriptionLabel.topAnchor.constraint(equalTo:
                                                self.titleLabel.bottomAnchor, constant: 16).isActive = true
        descriptionLabel.bottomAnchor.constraint(equalTo:
                                                    self.contentView.bottomAnchor, constant: -8).isActive = true
    }
    func configure(title: String, description: String) { }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
