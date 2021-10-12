import UIKit

protocol UserTableViewCellDelegate: AnyObject {
    func didTapAlbums(with userId: Int, by name: String)
    func didTapPosts(with userId: Int, by name: String)
}

class UserTableViewCell: ItemCell<User> {    
    
    // MARK: - Attributes
    let initialsLabel = UILabel.withName("initials")
    let nameLabel = UILabel.withName("name")
    let userNameLabel = UILabel.withName("username")
    let emailLabel = UILabel.withName("email")
    let phoneLabel = UILabel.withName("phone")
    
    let initialsView = UIView()
    let separatorView = UIView()
    var stackView = UIStackView()
    
    var index: Int = 0
    
    weak var delegate: UserTableViewCellDelegate?
    
    // MARK: - Mathods
    override func configure() {
        initialsView.backgroundColor = .systemYellow
        initialsView.translatesAutoresizingMaskIntoConstraints = false
        
        separatorView.backgroundColor = .lightGray
        separatorView.translatesAutoresizingMaskIntoConstraints = false
        
        setButtons()
        
        initialsView
            .add(subview: initialsLabel)
        
        contentView
            .add(subview: initialsView)
            .add(subview: separatorView)
            .add(subview: nameLabel)
            .add(subview: userNameLabel)
            .add(subview: emailLabel)
            .add(subview: phoneLabel)
            .add(subview: stackView)
    }
    
    override func setData(item: User) {
        index = item.uid
        initialsLabel.text = String(item.name.prefix(2))
        nameLabel.text = item.name
        userNameLabel.text = item.username
        emailLabel.text = item.email
        phoneLabel.text = item.phone
    }
    
    func setButtons() {
        let albumsButton = UIButton()
        albumsButton.setTitleColor(.systemYellow, for: .normal)
        albumsButton.setTitle("ÁLBUNS", for: .normal)
        albumsButton.addTarget(self, action: #selector(albumsAction), for: .touchUpInside)
        
        let postsButton = UIButton()
        postsButton.setTitleColor(.systemYellow, for: .normal)
        postsButton.setTitle("POSTAGENS", for: .normal)
        postsButton.addTarget(self, action: #selector(postsAction), for: .touchUpInside)
        
        stackView = UIStackView(arrangedSubviews: [albumsButton, postsButton])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
    }
    
    override func setConstraints() {
        initialsView
            .make(.width, equalTo: nil, constant: 88)
            .make(.height, equalTo: nil, constant: 88)
            .make(.top, equalTo: contentView, attribute: .top, constant: 16)
            .make(.leading, equalTo: contentView, attribute: .leading, constant: 16)
        
        initialsLabel
            .make(.centerX, equalTo: initialsView, attribute: .centerX)
            .make(.centerY, equalTo: initialsView, attribute: .centerY)
        
        nameLabel
            .make(.leading, equalTo: contentView, attribute: .leading, constant: 16)
            .make(.top, equalTo: initialsView, attribute: .bottom, constant: 16)
        
        separatorView
            .make(.leading, equalTo: nameLabel, attribute: .trailing, constant: 32)
            .make(.leading, equalTo: initialsView, attribute: .trailing, constant: 32)
            .make(.top, equalTo: contentView, attribute: .top, constant: 8)
            .make(.width, equalTo: nil, constant: 2)
        
        userNameLabel
            .make(.leading, equalTo: separatorView, attribute: .leading, constant: 16)
            .make(.trailing, equalTo: contentView, attribute: .trailing, constant: -16)
            .make(.top, equalTo: contentView, attribute: .top, constant: 16)
        
        emailLabel
            .make(.leading, equalTo: separatorView, attribute: .leading, constant: 16)
            .make(.trailing, equalTo: contentView, attribute: .trailing, constant: -16)
            .make(.top, equalTo: userNameLabel, attribute: .bottom, constant: 24)
        
        phoneLabel
            .make(.leading, equalTo: separatorView, attribute: .trailing, constant: 16)
            .make(.trailing, equalTo: contentView, attribute: .trailing, constant: -16)
            .make(.top, equalTo: emailLabel, attribute: .bottom, constant: 24)
        
        stackView
            .make(.top, equalTo: separatorView, attribute: .bottom, constant: 64)
            .make(.top, equalTo: phoneLabel, attribute: .bottom, constant: 64)
            .make(.bottom, equalTo: contentView, attribute: .bottom, constant: -8)
            .make(.leading, equalTo: contentView, attribute: .leading, constant: 16)
            .make(.trailing, equalTo: contentView, attribute: .trailing, constant: -16)
    }
    
    @objc func albumsAction(_ sender: UIButton) {
        delegate?.didTapAlbums(with: index, by: nameLabel.text ?? "")
    }
    
    @objc func postsAction(_ sender: UIButton) {
        delegate?.didTapPosts(with: index, by: nameLabel.text ?? "")
    }
    
}
