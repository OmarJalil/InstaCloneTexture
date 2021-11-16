//
//  BaseDataSource.swift
//  LearningTexture
//
//  Created by Jalil Fierro on 15/11/21.
//

import Foundation

struct BaseDataSource: Codable {
    
    var myUser: User?
    var stories: [Stories]?
    var newsFeed: [NewsFeed]?
    
    enum CodingKeys: String, CodingKey {
        case myUser = "my_user"
        case stories
        case newsFeed = "news_feed"
    }
}
