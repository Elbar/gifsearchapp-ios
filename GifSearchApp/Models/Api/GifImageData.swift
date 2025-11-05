//
//  GifImageData.swift
//  GifSearchApp
//
//  Created by Elbar on 4/11/25.
//

import Foundation

struct GifImageData: Codable {
    let url: String
    let width: String
    let height: String
    let size: String?
    

    var widthInt: Int {
        return Int(width) ?? 0
    }

    var heightInt: Int {
        return Int(height) ?? 0
    }
    
    var aspectRatio: CGFloat {
        let w = CGFloat(widthInt)
        let h = CGFloat(heightInt)
        return h > 0 ? w / h : 1.0
    }
}
