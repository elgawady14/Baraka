//
//  Article.swift
//  Baraka
//
//  Created by Ahmed Abduljawad on 27/05/2022.
//

import Foundation

struct Article: Codable, Hashable {
    var title: String
    var description: String
    var imageURL: String
    var date: String

    enum CodingKeys: String, CodingKey {
        case title = "title"
        case description = "description"
        case imageURL = "urlToImage"
        case date = "publishedAt"
    }
    
    func hash(into hasher: inout Hasher) {
      hasher.combine(identifier)
    }
    
    private let identifier = UUID()
}
