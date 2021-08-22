//
//  InfoCharacterModel.swift
//  RickyMortyChalenge
//
//  Created by Fellipe Ricciardi Chiarello on 8/22/21.
//

import Foundation

struct InfoCharacterModel: Codable {
    var count: Int?
    var pages: Int?
    var next: String?
    var previous: String?
    
    enum CodingKeys: String, CodingKey {
        case count = "count"
        case pages = "pages"
        case next = "next"
        case previous = "prev"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        count = try values.decodeIfPresent(Int.self, forKey: .count)
        pages = try values.decodeIfPresent(Int.self, forKey: .pages)
        next = try values.decodeIfPresent(String.self, forKey: .next)
        previous = try values.decode(String.self, forKey: .previous)
    }
}
