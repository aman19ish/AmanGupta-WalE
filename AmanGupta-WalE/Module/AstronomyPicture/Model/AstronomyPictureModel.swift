//
//  AstronomyPictureModel.swift
//  AmanGupta-WalE
//
//  Created by Aman gupta on 10/04/22.
//

import Foundation

struct AstronomyPictureModel: Codable {
    let date: String?
    let explanation: String?
    let hdurl: String?
    let mediaType: MediaType?
    let serviceVersion: String?
    let title: String?
    let url: String?
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        date = try container.decode(String.self, forKey: .date)
        explanation = try container.decode(String.self, forKey: .explanation)
        hdurl = try container.decode(String.self, forKey: .hdurl)
        let tempMediaType = try container.decode(String.self, forKey: .mediaType)
        switch tempMediaType {
        case "image":
            mediaType = .image
        default:
            mediaType = .noneType
        }
        self.serviceVersion = try container.decode(String.self, forKey: .serviceVersion)
        self.title = try container.decode(String.self, forKey: .serviceVersion)
        self.url = try container.decode(String.self, forKey: .serviceVersion)
    }
    
    func encode(to encoder: Encoder) throws {
        
    }
    
    enum CodingKeys: String, CodingKey {
        case date
        case explanation
        case hdurl
        case mediaType = "media_type"
        case serviceVersion = "service_version"
        case title
        case url
    }
}

enum MediaType {
    case image
    case noneType
}

