//
//  SearchState.swift
//  GifSearchApp
//
//  Created by Elbar on 4/11/25.
//


// MARK: - Search State Models
enum SearchState: Equatable {
    case idle
    case loading
    case loaded([Gif])
    case error(GifSearchError)
    case empty
    
    var isLoading: Bool {
        if case .loading = self {
            return true
        }
        return false
    }
    
    var gifs: [Gif] {
        if case .loaded(let gifs) = self {
            return gifs
        }
        return []
    }
    
    var error: GifSearchError? {
        if case .error(let error) = self {
            return error
        }
        return nil
    }
}