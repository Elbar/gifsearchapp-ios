//
//  Gif.swift
//  GifSearchApp
//
//  Created by Elbar on 4/11/25.
//


import Foundation

// MARK: - Domain Models
struct Gif: Identifiable, Hashable {
    let id: String
    let title: String
    let url: String
    let username: String?
    let rating: String
    let originalImageURL: String
    let thumbnailURL: String?
    let previewURL: String?
    let width: Int
    let height: Int
    let aspectRatio: CGFloat
    

    init(from gifData: GifData) {
        self.id = gifData.id
        self.title = gifData.title.isEmpty ? "Untitled GIF" : gifData.title
        self.url = gifData.url
        self.username = gifData.username
        self.rating = gifData.rating
        self.originalImageURL = gifData.images.original.url
        self.thumbnailURL = gifData.images.fixedHeight?.url ?? 
                           gifData.images.downsized?.url
        
        self.previewURL = gifData.images.preview?.url
        self.width = gifData.images.original.widthInt
        self.height = gifData.images.original.heightInt
        self.aspectRatio = gifData.images.original.aspectRatio
    }
    
    var displayTitle: String {
        return title.isEmpty ? "GIF by \(username ?? "Unknown")" : title
    }
    
    var isGeneralAudience: Bool {
        return rating.lowercased() == "g"
    }
    
    // MARK: - Hashable Conformance
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: Gif, rhs: Gif) -> Bool {
        return lhs.id == rhs.id
    }
}




