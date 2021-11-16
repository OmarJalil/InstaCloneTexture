//
//  NewsFeedCell.swift
//  LearningTexture
//
//  Created by Jalil Fierro on 15/11/21.
//

import AsyncDisplayKit

class NewsFeedCell: BaseCellNode {
    
    let headerNode = HeaderNode()
    let feedImage = FeedImageNode()
    let socialButtons = SocialNode()
    
    var newsFeed: NewsFeed?
    
    init(feed: NewsFeed?) {
        super.init()
        self.newsFeed = feed
        populate(feed: feed)
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        
        let vStack = ASStackLayoutSpec(
            direction: .vertical,
            spacing: 0,
            justifyContent: .start,
            alignItems: .stretch,
            children: [headerNode, feedImage, socialButtons])
        
        return vStack
    }
    
    private func populate(feed: NewsFeed?) {
        
        guard let feed = feed else { return }
        
        headerNode.populate(user: feed.user)
        socialButtons.populate(feed: feed)
        feedImage.populate(feed: feed)
    }
}
