//
//  NewsFeedCell.swift
//  LearningTexture
//
//  Created by Jalil Fierro on 15/11/21.
//

import AsyncDisplayKit

class NewsFeedCell: BaseCellNode {
    
    let headerNode = HeaderNode()
    let feedImageNode = FeedImageNode()
    let socialButtonsNode = SocialNode()
    let lastCommentNode = LastCommentNode()
    
    var newsFeed: NewsFeed?
    
    init(feed: NewsFeed?) {
        super.init()
        self.newsFeed = feed
        populate(feed: feed)
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        
        var elements = [ASLayoutElement]()
        elements.append(headerNode)
        elements.append(feedImageNode)
        elements.append(socialButtonsNode)
        
        if let lastComment = newsFeed?.lastComment, lastComment.comment?.isEmpty == false {
            elements.append(lastCommentNode)
        }
        
        let vStack = ASStackLayoutSpec(
            direction: .vertical,
            spacing: 0,
            justifyContent: .start,
            alignItems: .stretch,
            children: elements)
        
        return vStack
    }
    
    private func populate(feed: NewsFeed?) {
        
        guard let feed = feed else { return }
        
        headerNode.populate(user: feed.user)
        socialButtonsNode.populate(feed: feed)
        feedImageNode.populate(feed: feed)
        lastCommentNode.populate(feed: feed)
    }
}
