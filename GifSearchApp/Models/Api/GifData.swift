//
//  GifData.swift
//  GifSearchApp
//
//  Created by Elbar on 4/11/25.
//


import Foundation

// MARK: - Core GIF Data Model
struct GifData: Codable, Identifiable {
    let id: String
    let title: String
    let url: String
    let username: String?
    let rating: String
    let importDatetime: String
    let trendingDatetime: String?
    let images: GifImages
    
    enum CodingKeys: String, CodingKey {
        case id, title, url, username, rating
        case importDatetime = "import_datetime"
        case trendingDatetime = "trending_datetime"
        case images
    }
}
