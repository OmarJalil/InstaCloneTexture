//
//  LastCommentNode.swift
//  LearningTexture
//
//  Created by Jalil Fierro on 15/11/21.
//

import AsyncDisplayKit

class LastCommentNode: BaseNode {
    
    var imageNode = ASNetworkImageNode()
    var nameNode = ASTextNode()
    var textNode = ASTextNode()
    
    override init() {
        super.init()
        setup()
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        
        let vStack = ASStackLayoutSpec(
            direction: .vertical,
            spacing: 6,
            justifyContent: .start,
            alignItems: .stretch,
            children: [nameNode, textNode])
        
        vStack.style.flexShrink = 1
        vStack.style.flexGrow = 1
        
        let layoutSpec = ASStackLayoutSpec(
            direction: .horizontal,
            spacing: 6,
            justifyContent: .start,
            alignItems: .stretch,
            children: [imageNode, vStack])
        
        return ASInsetLayoutSpec(insets: .init(top: 10, left: 10, bottom: 10, right: 10), child: layoutSpec)
        
    }
    
    func populate(feed: NewsFeed?) {
        textNode.attributedText = NSAttributedString(string: feed?.lastComment?.comment ?? "", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 13), NSAttributedString.Key.foregroundColor : UIColor.label])
        nameNode.attributedText = NSAttributedString(string: feed?.lastComment?.user?.username ?? "", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 13), NSAttributedString.Key.foregroundColor : UIColor.label])
        imageNode.url = URL(string: feed?.lastComment?.user?.profileIcon ?? "")
    }
    
    private func setup() {
        imageNode.backgroundColor = .white
        imageNode.style.preferredSize = CGSize(width: 20, height: 20)
        imageNode.cornerRadius = 20 / 2
    }
}
