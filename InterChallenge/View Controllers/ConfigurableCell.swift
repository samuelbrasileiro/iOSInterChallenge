//
//  File.swift
//  InterChallenge
//
//  Created by Samuel Brasileiro on 09/10/21.
//

import UIKit

protocol ConfigurableCell{
    func configure<T>(item: T)
}

protocol CellConfigurationDelegate{
    associatedtype CellType
    func cellConfigurationCompletion(cell: CellType, at cellRow: Int)
}
