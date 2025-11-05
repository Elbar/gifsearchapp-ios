//
//  PaginationState.swift
//  GifSearchApp
//
//  Created by Elbar on 4/11/25.
//


// MARK: - Pagination State
struct PaginationState {
    var offset: Int = 0
    var isLoadingMore: Bool = false
    var hasMoreResults: Bool = true
    var totalResults: Int = 0
    
    mutating func reset() {
        offset = 0
        isLoadingMore = false
        hasMoreResults = true
        totalResults = 0
    }
    
    mutating func update(with pagination: Pagination) {
        offset = pagination.offset + pagination.count
        hasMoreResults = pagination.hasMoreResults
        totalResults = pagination.totalCount
        isLoadingMore = false
    }
    
    mutating func startLoadingMore() {
        isLoadingMore = true
    }
    
    var canLoadMore: Bool {
        return hasMoreResults && !isLoadingMore
    }
}
