//
//  Article.swift
//  Baraka
//
//  Created by Ahmed Abduljawad on 27/05/2022.
//

import Foundation

struct Article: Codable {
    var title: String
    var description: String
    var image: String
    var date: String

    enum CodingKeys: String, CodingKey {
        case title = "title"
        case description = "description"
        case image = "urlToImage"
        case date = "publishedAt"
    }
}
