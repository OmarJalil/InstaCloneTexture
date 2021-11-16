//
//  Stories.swift
//  LearningTexture
//
//  Created by Jalil Fierro on 15/11/21.
//

import Foundation

struct Stories: Codable{
    let user: User
    let isWatched: Bool?
    
    enum CodingKeys: String, CodingKey{
        case user
        case isWatched = "is_watched"
    }
}
