import UIKit

protocol UserTableViewCellDelegate: AnyObject {
    func didTapAlbums(with userId: Int, by name: String)
    func didTapPosts(with userId: Int, by name: String)
}

class UserTableViewCell: GenericCell<User> {    
    
    var initialsLabel = UILabel.with(name: "initials")
    var nameLabel = UILabel.with(name: "name")
    var userNameLabel = UILabel.with(name: "username")
    let emailLabel = UILabel.with(name: "email")
    let phoneLabel = UILabel.with(name: "phone")
    
    var initialsView = UIView()
    var separatorView = UIView()
    var stackView = UIStackView()
    
    var index: Int = 0
    
    weak var delegate: UserTableViewCellDelegate?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    override func configure() {
        setInitialsView()
        setSeparator()
        setButtons()
        
        initialsView.addSubview(initialsLabel)
        self.contentView.addSubview(initialsView)
        self.contentView.addSubview(separatorView)
        self.contentView.addSubview(nameLabel)
        self.contentView.addSubview(userNameLabel)
        self.contentView.addSubview(emailLabel)
        self.contentView.addSubview(phoneLabel)
        self.contentView.addSubview(stackView)
    }
    
    override func setData(item: User) {
        index = item.uid
        initialsLabel.text = String(item.name.prefix(2))
        nameLabel.text = item.name
        userNameLabel.text = item.username
        emailLabel.text = item.email
        phoneLabel.text = item.phone
    }
    
    func setInitialsView() {
        initialsView = UIView()
        initialsView.backgroundColor = .systemYellow
        initialsView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setSeparator() {
        separatorView = UIView()
        separatorView.backgroundColor = .lightGray
        separatorView.translatesAutoresizingMaskIntoConstraints = false
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
        setInitialViewConstraints()
        
        nameLabel.leadingAnchor.constraint(
            equalTo: self.contentView.leadingAnchor, constant: 16).isActive = true
        nameLabel.topAnchor.constraint(equalTo: initialsView.bottomAnchor, constant: 16).isActive = true
        
        separatorView.topAnchor.constraint(
            equalTo: self.contentView.topAnchor, constant: 8).isActive = true
        separatorView.widthAnchor.constraint(equalToConstant: 2).isActive = true
        
        separatorView.leadingAnchor.constraint(
            equalTo: nameLabel.trailingAnchor, constant: 32).isActive = true
        separatorView.leadingAnchor.constraint(
            equalTo: initialsView.trailingAnchor, constant: 32).isActive = true
        
        userNameLabel.trailingAnchor.constraint(
            equalTo: contentView.trailingAnchor, constant: -16).isActive = true
        userNameLabel.leadingAnchor.constraint(
            equalTo: separatorView.trailingAnchor, constant: 16).isActive = true
        userNameLabel.topAnchor.constraint(
            equalTo: self.contentView.topAnchor, constant: 16).isActive = true
        
        emailLabel.topAnchor.constraint(
            equalTo: userNameLabel.bottomAnchor, constant: 24).isActive = true
        emailLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -16).isActive = true
        emailLabel.leadingAnchor.constraint(equalTo: separatorView.trailingAnchor, constant: 16).isActive = true
        
        phoneLabel.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 24).isActive = true
        phoneLabel.leadingAnchor.constraint(equalTo: separatorView.trailingAnchor, constant: 16).isActive = true
        phoneLabel.trailingAnchor.constraint(
            equalTo: self.contentView.trailingAnchor, constant: 16).isActive = true
        
        stackView.topAnchor.constraint(
            equalTo: separatorView.bottomAnchor, constant: 64).isActive = true
        stackView.topAnchor.constraint(
            equalTo: phoneLabel.bottomAnchor, constant: 64).isActive = true
        stackView.bottomAnchor.constraint(
            equalTo: self.contentView.bottomAnchor, constant: -8).isActive = true
        stackView.leadingAnchor.constraint(
            equalTo: self.contentView.leadingAnchor, constant: 16).isActive = true
        stackView.trailingAnchor.constraint(
            equalTo: self.contentView.trailingAnchor, constant: -16).isActive = true
    }
    
    func setInitialViewConstraints() {
        initialsView.widthAnchor.constraint(equalToConstant: 88).isActive = true
        initialsView.heightAnchor.constraint(equalToConstant: 88).isActive = true
        initialsLabel.centerXAnchor.constraint(
            equalTo: initialsView.centerXAnchor).isActive = true
        initialsLabel.centerYAnchor.constraint(
            equalTo: initialsView.centerYAnchor).isActive = true
        initialsView.topAnchor.constraint(
            equalTo: self.contentView.topAnchor, constant: 16).isActive = true
        initialsView.leadingAnchor.constraint(
            equalTo: self.contentView.leadingAnchor, constant: 16).isActive = true
    }
    
    @objc func albumsAction(_ sender: UIButton) {
        delegate?.didTapAlbums(with: index, by: nameLabel.text ?? "")
    }
    
    @objc func postsAction(_ sender: UIButton) {
        delegate?.didTapPosts(with: index, by: nameLabel.text ?? "")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
