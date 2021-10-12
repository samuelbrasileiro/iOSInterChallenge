//
//  DetailsViewModel.swift
//  InterChallenge
//
//  Created by Samuel Brasileiro on 08/10/21.
//

import Alamofire
import UIKit

protocol DetailsViewModelDelegate: AnyObject {
    
    func reloadName(_ name: String)
    func reloadImage(_ image: UIImage)
    
    func handleError(error: Error)
}

class DetailsViewModel {
    
    weak var delegate: DetailsViewModelDelegate?
    weak var errorHandler: ErrorHandler?
    
    var apiService = APIService<Photo>()
    
    func configure(photo: Photo) {

        delegate?.reloadName(photo.title)
        
        apiService.downloadImage(from: photo.url) { [weak self] result in
            if case .success(let image) = result {
                self?.delegate?.reloadImage(image) // ARC
            } else if case .failure(let error) = result {
                print(error)
                self?.delegate?.handleError(error: error)
            }
        }
    }
}
