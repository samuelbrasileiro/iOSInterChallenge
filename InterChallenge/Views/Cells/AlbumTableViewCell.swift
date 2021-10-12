import UIKit

class AlbumTableViewCell: ItemCell<Album> {    

    // MARK: - Attributes
    let albumNameLabel = UILabel.withName("album name")
    
    // MARK: - Methods
    override func configure() {
        self.contentView.add(subview: albumNameLabel)
    }
    
    override func setConstraints() {
        albumNameLabel.leadingAnchor.constraint(
            equalTo: self.contentView.leadingAnchor, constant: 16).isActive = true
        albumNameLabel.topAnchor.constraint(
            equalTo: self.contentView.topAnchor, constant: 16).isActive = true
        albumNameLabel.trailingAnchor.constraint(
            equalTo: self.contentView.trailingAnchor, constant: -16).isActive = true
        albumNameLabel.bottomAnchor.constraint(
            equalTo: self.contentView.bottomAnchor, constant: -16).isActive = true
    }
    
    override func setData(item: Album) {
        self.albumNameLabel.text = item.title
    }
    
}
