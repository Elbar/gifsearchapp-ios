//
//  GifImages.swift
//  GifSearchApp
//
//  Created by Elbar on 4/11/25.
//


// MARK: - Image Data Models
struct GifImages: Codable {
    let original: GifImageData
    let downsized: GifImageData?
    let downsizedMedium: GifImageData?
    let preview: GifImageData?
    let fixedHeight: GifImageData?
    let fixedWidth: GifImageData?
    
    enum CodingKeys: String, CodingKey {
        case original, downsized
        case downsizedMedium = "downsized_medium"
        case preview
        case fixedHeight = "fixed_height"
        case fixedWidth = "fixed_width"
    }
}
