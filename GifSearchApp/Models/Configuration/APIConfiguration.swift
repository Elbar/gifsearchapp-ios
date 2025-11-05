//
//  containing.swift
//  GifSearchApp
//
//  Created by Elbar on 4/11/25.
//


import Foundation

// MARK: - API Configuration

struct APIConfiguration {
    
    // MARK: - Giphy API Constants
    
    static let baseURL = "https://api.giphy.com/v1/gifs"
    
    static var apiKey: String {
           return APIKeyManager.shared.giphyAPIKey
       }
    
    // MARK: - API Endpoints
    static let searchEndpoint = "/search"
    
    static let trendingEndpoint = "/trending"
    
    static let gifByIdEndpoint = "/"
    
    // MARK: - Request Parameters
    static let defaultLimit = 25
    
    static let maxLimit = 50
    
    static let defaultOffset = 0
    
    static let defaultRating = "g"
    
    static let availableRatings = ["g", "pg", "pg-13", "r"]
    
    // MARK: - Search Configuration
    static let searchDebounceDelay: TimeInterval = 0.3
    
    static let minimumQueryLength = 1
    
    static let maximumQueryLength = 100
    
    // MARK: - Network Configuration
    static let requestTimeout: TimeInterval = 30.0
    
    static let maxRetryAttempts = 3
    
    static let retryDelay: TimeInterval = 1.0
    
    // MARK: - Cache Configuration
    static let maxCachedImages = 100
    
    static let cacheExpirationTime: TimeInterval = 3600
    
    // MARK: - UI Configuration
    static let gridSpacing: CGFloat = 8.0
    
    static let minimumItemWidth: CGFloat = 120.0
    
    static let defaultAspectRatio: CGFloat = 1.0
    
    static let paginationThreshold = 5
}
