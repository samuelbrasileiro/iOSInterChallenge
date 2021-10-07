import UIKit

protocol UserTableViewCellDelegate: AnyObject {
    func didTapAlbums(with userId: Int, by name: String)
    func didTapPosts(with userId: Int, by name: String)
}

class UserTableViewCell: UITableViewCell {
    
    let initialsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "initials"
        return label
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "name"
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let userNameLabel: UILabel = {
        let label = UILabel()
        label.text = "username"
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let emailLabel: UILabel = {
        let label = UILabel()
        label.text = "email"
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let phoneLabel: UILabel = {
        let label = UILabel()
        label.text = "phone"
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var id: Int = 0
    var delegate: UserTableViewCellDelegate?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let initialsView = UIView()
        initialsView.backgroundColor = .systemYellow
        initialsView.translatesAutoresizingMaskIntoConstraints = false
        let separatorView = UIView()
        separatorView.backgroundColor = .lightGray
        separatorView.translatesAutoresizingMaskIntoConstraints = false
        
        
        let albumsButton = UIButton()
        albumsButton.setTitleColor(.systemYellow, for: .normal)
        albumsButton.setTitle("ÁLBUNS", for: .normal)
        albumsButton.addTarget(self, action: #selector(albumsAction), for:.touchUpInside)
        
        
        let postsButton = UIButton()
        postsButton.setTitleColor(.systemYellow, for: .normal)
        postsButton.setTitle("POSTAGENS", for: .normal)
        postsButton.addTarget(self, action: #selector(postsAction), for:.touchUpInside)
        
        let stackView = UIStackView(arrangedSubviews: [albumsButton, postsButton])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        
        initialsView.addSubview(initialsLabel)
        self.contentView.addSubview(initialsView)
        
        self.contentView.addSubview(separatorView)

        self.contentView.addSubview(nameLabel)
        self.contentView.addSubview(userNameLabel)
        self.contentView.addSubview(emailLabel)
        self.contentView.addSubview(phoneLabel)

        stackView.addSubview(postsButton)
        stackView.addSubview(albumsButton)
        self.contentView.addSubview(stackView)
        
        
        
        initialsView.widthAnchor.constraint(equalToConstant: 88).isActive = true
        initialsView.heightAnchor.constraint(equalToConstant: 88).isActive = true
        initialsLabel.centerXAnchor.constraint(equalTo: initialsView.centerXAnchor).isActive = true
        initialsLabel.centerYAnchor.constraint(equalTo: initialsView.centerYAnchor).isActive = true
        separatorView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 8).isActive = true
        separatorView.widthAnchor.constraint(equalToConstant: 2).isActive = true

        initialsView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 16).isActive = true
        initialsView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 16).isActive = true
        
        nameLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 16).isActive = true
        nameLabel.topAnchor.constraint(equalTo: initialsView.bottomAnchor, constant: 16).isActive = true
        separatorView.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: 32).isActive = true
        separatorView.leadingAnchor.constraint(equalTo: initialsView.trailingAnchor, constant: 32).isActive = true
        self.contentView.trailingAnchor.constraint(equalTo: userNameLabel.trailingAnchor, constant: 16).isActive = true
        userNameLabel.leadingAnchor.constraint(equalTo: separatorView.trailingAnchor, constant: 16).isActive = true
        userNameLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 16).isActive = true
        emailLabel.topAnchor.constraint(equalTo: userNameLabel.bottomAnchor, constant: 24).isActive = true
        self.contentView.trailingAnchor.constraint(equalTo: emailLabel.trailingAnchor, constant: 16).isActive = true
        emailLabel.leadingAnchor.constraint(equalTo: separatorView.trailingAnchor, constant: 16).isActive = true
        phoneLabel.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 24).isActive = true
        phoneLabel.leadingAnchor.constraint(equalTo: separatorView.trailingAnchor, constant: 16).isActive = true
        self.contentView.trailingAnchor.constraint(equalTo: phoneLabel.trailingAnchor, constant: 16).isActive = true
        stackView.topAnchor.constraint(equalTo: separatorView.bottomAnchor, constant: 64).isActive = true
        stackView.topAnchor.constraint(equalTo: phoneLabel.bottomAnchor, constant: 64).isActive = true
        self.contentView.bottomAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 8).isActive = true
        stackView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 16).isActive = true
        self.contentView.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: 16).isActive = true

        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @objc func albumsAction(_ sender: UIButton) {
        delegate?.didTapAlbums(with: id, by: nameLabel.text ?? "")
    }
    
    @objc func postsAction(_ sender: UIButton) {
        delegate?.didTapPosts(with: id, by: nameLabel.text ?? "")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
