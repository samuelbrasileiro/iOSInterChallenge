//
//  DetailsViewModel.swift
//  InterChallenge
//
//  Created by Samuel Brasileiro on 08/10/21.
//

import Alamofire
import UIKit

class DetailsViewModel {
    var photo = UIImage()
    var name = "name"
    weak var delegate: DetailsViewModelDelegate?
        func configure(photo: Photo) {
        name = photo.title
        delegate?.reloadName(name)
        AF.download(photo.url).responseData { [weak self] response in
            guard let self = self else {return}
            switch response.result {
            case .success(let data):
                if let photo = UIImage(data: data) {
                    self.photo = photo
                    self.delegate?.reloadImage(photo) // ARC
                }
            default:
                break
            }
        }
    }
}

protocol DetailsViewModelDelegate: AnyObject {
    func reloadName(_ name: String)
    func reloadImage(_ image: UIImage)
}
