//
//  AstronomyPictureViewModel.swift
//  AmanGupta-WalE
//
//  Created by Aman gupta on 10/04/22.
//

import Foundation

class AstronomyPictureViewModel {
    // MARK: - Properties
    var serviceManager = AstronomPictureServiceManager()
    var todayPictureModel: AstronomyPictureModel?
    var errorMessage: ((_ errorMsg: String) -> Void)?
    var showData: ((_ model: AstronomyPictureModel?) -> Void)?

    // MARK: - Initilizer Method
    init() {
        fetchData()
    }
    
}

extension AstronomyPictureViewModel {
    func fetchData() {
        serviceManager.fetchAstronomyData { [weak self] response in
            switch response {
            case .success(let model):
                self?.todayPictureModel = model
                self?.showData?(self?.todayPictureModel)
            case .failure(let error):
                self?.errorMessage?(error.localizedDescription)
                break
            }
        }
    }
    
    func fetchImage(imageURLString: String, handler: @escaping(_ imageURl: String, _ data: Data?, _ error: String?) -> Void)  {
        serviceManager.downloadImage(imageUrlString: imageURLString) { (imageURL, data, error) in
            handler(imageURL, data, error)
        }
    }
    
}
