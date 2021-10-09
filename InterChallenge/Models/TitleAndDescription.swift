//
//  TitleAndDescription.swift
//  InterChallenge
//
//  Created by Samuel Brasileiro on 08/10/21.
//

import Foundation

protocol TitleAndDescription: Codable {
    var title: String {get}
    var description:  String {get}
}
