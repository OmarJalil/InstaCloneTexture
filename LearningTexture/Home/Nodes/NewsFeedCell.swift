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
    
    override init() {
        super.init()
        
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
}
