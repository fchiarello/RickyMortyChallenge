//
//  CharacterModel.swift
//  RickyMortyChalenge
//
//  Created by Fellipe Ricciardi Chiarello on 8/22/21.
//

import Foundation

struct CharacterModel: Codable {
    var info: InfoCharacterModel?
    var results: ResultCharacterModel?
    
    enum CodingKeys: String, CodingKey {
        case info = "info"
        case results = "results"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        info = try values.decodeIfPresent(InfoCharacterModel.self, forKey: .info)
        results = try values.decodeIfPresent(ResultCharacterModel.self, forKey: .results)
    }
}
