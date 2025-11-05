//
//  GiphySearchResponse.swift
//  GifSearchApp
//
//  Created by Elbar on 4/11/25.
//


import Foundation

// MARK: - API Response Models
struct GiphySearchResponse: Codable {
    let data: [GifData]
    let pagination: Pagination
    let meta: Meta
}
