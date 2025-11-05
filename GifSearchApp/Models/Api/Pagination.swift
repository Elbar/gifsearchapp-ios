//
//  Pagination.swift
//  GifSearchApp
//
//  Created by Elbar on 4/11/25.
//


// MARK: - Pagination and Meta Models
struct Pagination: Codable {
    let totalCount: Int
    let count: Int
    let offset: Int
    
    enum CodingKeys: String, CodingKey {
        case totalCount = "total_count"
        case count, offset
    }
    
    var hasMoreResults: Bool {
        return offset + count < totalCount
    }
}
