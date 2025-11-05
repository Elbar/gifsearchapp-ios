//
//  Meta.swift
//  GifSearchApp
//
//  Created by Elbar on 4/11/25.
//


struct Meta: Codable {
    let status: Int
    let msg: String
    let responseId: String
    
    enum CodingKeys: String, CodingKey {
        case status, msg
        case responseId = "response_id"
    }
    
    var isSuccess: Bool {
        return status == 200
    }
}
