//
//  GifSearchError.swift
//  GifSearchApp
//
//  Created by Elbar on 4/11/25.
//

import Foundation

// MARK: - Error Models
enum GifSearchError: Error, LocalizedError, Equatable {
    case networkError(String)
    case invalidURL
    case noData
    case decodingError(String)
    case serverError(Int)
    case noInternetConnection
    case rateLimitExceeded
    case invalidAPIKey
    case unknown(String)
    
    var errorDescription: String? {
        switch self {
        case .networkError(let message):
            return "Network error: \(message)"
        case .invalidURL:
            return "Invalid URL provided"
        case .noData:
            return "No data received from server"
        case .decodingError(let message):
            return "Data parsing error: \(message)"
        case .serverError(let code):
            return "Server error (\(code))"
        case .noInternetConnection:
            return "No internet connection available"
        case .rateLimitExceeded:
            return "Too many requests. Please try again later."
        case .invalidAPIKey:
            return "API authentication failed"
        case .unknown(let message):
            return "Unexpected error: \(message)"
        }
    }
    
    var title: String {
        switch self {
        case .networkError, .noInternetConnection:
            return "Connection Error"
        case .serverError, .rateLimitExceeded, .invalidAPIKey:
            return "Server Error"
        case .decodingError, .noData, .invalidURL:
            return "Data Error"
        case .unknown:
            return "Error"
        }
    }
    
    var isRecoverable: Bool {
        switch self {
        case .networkError, .noInternetConnection, .serverError, .rateLimitExceeded:
            return true
        case .invalidURL, .decodingError, .noData, .invalidAPIKey, .unknown:
            return false
        }
    }
    
    // MARK: - Equatable Conformance
    static func == (lhs: GifSearchError, rhs: GifSearchError) -> Bool {
        switch (lhs, rhs) {
        case (.networkError(let lhsMessage), .networkError(let rhsMessage)):
            return lhsMessage == rhsMessage
        case (.invalidURL, .invalidURL),
             (.noData, .noData),
             (.noInternetConnection, .noInternetConnection),
             (.rateLimitExceeded, .rateLimitExceeded),
             (.invalidAPIKey, .invalidAPIKey):
            return true
        case (.decodingError(let lhsMessage), .decodingError(let rhsMessage)):
            return lhsMessage == rhsMessage
        case (.serverError(let lhsCode), .serverError(let rhsCode)):
            return lhsCode == rhsCode
        case (.unknown(let lhsMessage), .unknown(let rhsMessage)):
            return lhsMessage == rhsMessage
        default:
            return false
        }
    }
}
