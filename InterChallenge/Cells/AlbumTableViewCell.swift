import UIKit

class AlbumTableViewCell: UITableViewCell, ConfigurableCell {

    let albumNameLabel = UILabel.with(name: "album name")
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
        setConstraints()
    }
    func configure() {
        self.contentView.addSubview(albumNameLabel)
    }
    func setConstraints() {
        albumNameLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 16).isActive = true
        albumNameLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 16).isActive = true
        albumNameLabel.trailingAnchor.constraint(equalTo:
                                                    self.contentView.trailingAnchor, constant: -16).isActive = true
        albumNameLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -16).isActive = true
    }
    func setData<T>(item: T) {
        if let item = item as? Album {
            self.albumNameLabel.text = item.title
        }
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
