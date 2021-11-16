//
//  NewsFeed.swift
//  LearningTexture
//
//  Created by Jalil Fierro on 15/11/21.
//

import Foundation

struct NewsFeed: Codable{
    let user: User?
    let imageUrl: String?
    let aspectRatio: Double?
    let likes: Int?
    let lastComment: Comment?
    let postId: Int
    
    enum CodingKeys: String, CodingKey{
        case user, likes
        case imageUrl = "image_url"
        case aspectRatio = "aspect_ratio"
        case lastComment = "last_comment"
        case postId = "post_id"
    }
}
