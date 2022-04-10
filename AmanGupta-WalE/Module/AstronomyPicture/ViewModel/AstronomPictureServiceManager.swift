//
//  AstronomPictureServiceManager.swift
//  AmanGupta-WalE
//
//  Created by Aman gupta on 10/04/22.
//

import Foundation

class AstronomPictureServiceManager {
    func fetchAstronomyData(handler: @escaping(_ response: Result<AstronomyPictureModel, Error>) -> Void) {
        if let url = URL(string: "https://api.nasa.gov/planetary/apod?api_key=Bh0UzosPIppRN6frFXycqAOTyI90IEZSQYy7blJn") {
            let request = URLRequest(url: url)
            NetworkingHandler.sharedInstance.get(forRequestType: request, completionHandler: handler)
        } else {
            handler(.failure(Error.self as! Error))
        }
    }
    
    func downloadImage(imageUrlString: String?, handler: @escaping(_ imageURl: String, _ data: Data?, _ error: String?) -> Void) {
        if let imageUrlString = imageUrlString {
            NetworkingHandler.sharedInstance.downloadImage(urlString: imageUrlString, completion: handler)
        }
    }
    
}
