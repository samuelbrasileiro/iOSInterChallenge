//
//  GenericCell.swift
//  InterChallenge
//
//  Created by Samuel Brasileiro on 10/10/21.
//

import UIKit

class GenericCell<ItemType>: UITableViewCell, ConfigurableCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configure()
        
        setConstraints()
    }
    
    func setData(item: ItemType) { }
    
    func setConstraints() { }
    
    func configure() { }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
