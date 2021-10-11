//
//  File.swift
//  InterChallenge
//
//  Created by Samuel Brasileiro on 09/10/21.
//

import UIKit

protocol ConfigurableCell: UITableViewCell {
    associatedtype ItemType
    
    func setData(item: ItemType)
    func setConstraints()
    func configure()
}

protocol CellConfigurationDelegate: AnyObject {
    associatedtype CellType
    
    func cellConfigurationCompletion(cell: CellType, at cellRow: Int)
}
