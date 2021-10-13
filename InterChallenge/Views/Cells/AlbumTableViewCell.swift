import UIKit

class AlbumTableViewCell: ItemCell<Album> {    

    // MARK: - Attributes
    let albumNameLabel = UILabel.with(text: "album name")
    
    // MARK: - Methods
    override func configure() {
        self.contentView.add(subview: albumNameLabel)
    }
    
    override func setConstraints() {
        albumNameLabel
            .make(.leading, equalTo: contentView, attribute: .leading, constant: 16)
            .make(.trailing, equalTo: contentView, attribute: .trailing, constant: -16)
            .make(.top, equalTo: contentView, attribute: .top, constant: 16)
            .make(.bottom, equalTo: contentView, attribute: .bottom, constant: -16)
    }
    
    override func setData(item: Album) {
        self.albumNameLabel.text = item.title
    }
    
}
