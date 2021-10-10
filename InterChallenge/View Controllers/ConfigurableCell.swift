//
//  File.swift
//  InterChallenge
//
//  Created by Samuel Brasileiro on 09/10/21.
//

import UIKit

protocol ConfigurableCell: AnyObject {
    func setData<T>(item: T)
    func setConstraints()
    func configure()
}

protocol CellConfigurationDelegate: AnyObject {
    associatedtype CellType
    
    func cellConfigurationCompletion(cell: CellType, at cellRow: Int)
}
