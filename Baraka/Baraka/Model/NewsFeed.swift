//
//  NewsFeed.swift
//  Baraka
//
//  Created by Ahmed Abduljawad on 27/05/2022.
//

import Foundation

struct NewsFeed: Codable {
    var articles: [Article]
    enum CodingKeys: String, CodingKey {
        case articles = "articles"
    }
}
