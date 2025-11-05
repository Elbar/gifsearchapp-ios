//
//  APIEndpointBuilder.swift
//  GifSearchApp
//
//  Created by Elbar on 4/11/25.
//

import Foundation


// MARK: - API Endpoint Builder
struct APIEndpointBuilder {
  
    static func searchURL(
        query: String,
        limit: Int = APIConfiguration.defaultLimit,
        offset: Int = APIConfiguration.defaultOffset,
        rating: String = APIConfiguration.defaultRating
    ) -> URL? {
        guard !query.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
            return nil
        }
        
        var components = URLComponents(string: APIConfiguration.baseURL + APIConfiguration.searchEndpoint)
        components?.queryItems = [
            URLQueryItem(name: "api_key", value: APIConfiguration.apiKey),
            URLQueryItem(name: "q", value: query),
            URLQueryItem(name: "limit", value: String(limit)),
            URLQueryItem(name: "offset", value: String(offset)),
            URLQueryItem(name: "rating", value: rating)
        ]
        
        return components?.url
    }
  
    static func trendingURL(
        limit: Int = APIConfiguration.defaultLimit,
        offset: Int = APIConfiguration.defaultOffset,
        rating: String = APIConfiguration.defaultRating
    ) -> URL? {
        var components = URLComponents(string: APIConfiguration.baseURL + APIConfiguration.trendingEndpoint)
        components?.queryItems = [
            URLQueryItem(name: "api_key", value: APIConfiguration.apiKey),
            URLQueryItem(name: "limit", value: String(limit)),
            URLQueryItem(name: "offset", value: String(offset)),
            URLQueryItem(name: "rating", value: rating)
        ]
        
        return components?.url
    }
  
    static func gifByIdURL(gifId: String) -> URL? {
        guard !gifId.isEmpty else { return nil }
        
        var components = URLComponents(string: APIConfiguration.baseURL + APIConfiguration.gifByIdEndpoint + gifId)
        components?.queryItems = [
            URLQueryItem(name: "api_key", value: APIConfiguration.apiKey)
        ]
        
        return components?.url
    }
}
