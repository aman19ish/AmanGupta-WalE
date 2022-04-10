//
//  NetworkingHandler.swift
//  AmanGupta-WalE
//
//  Created by Aman gupta on 10/04/22.
//

import Foundation

class NetworkingHandler {
    // MARK: - Instance
    static let sharedInstance = NetworkingHandler()
    
    let session = URLSession.shared
    
    func get<T:Codable>(forRequestType requestType : URLRequest, completionHandler : @escaping (Result<T, Error>) -> ()) {
        let task = session.dataTask(with: requestType) { (data, response, error) in
            guard error == nil, let dataObject = data else {
                completionHandler(.failure(error!))
                return
            }
            do {
                let modelObj = try JSONDecoder().decode(T.self, from: dataObject)
                completionHandler(.success(modelObj))
            } catch {
                completionHandler(.failure(error))
                print(error)
            }
        }
        task.resume()
    }
    
    func downloadImage(urlString: String, completion: @escaping(_ imageURl: String, _ data: Data?, _ error: String?) -> Void) {
        let session = URLSession.shared
        if let url = URL(string: urlString) {
            let request = URLRequest(url: url)
            session.dataTask(with: request) { (data, response, error) in
                completion(urlString, data, error?.localizedDescription)
            }.resume()
        } else {
            debugPrint("URL string is not coorect")
        }
    }
    
}
