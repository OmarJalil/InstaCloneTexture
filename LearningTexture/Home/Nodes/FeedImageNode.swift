//
//  FeedImageNode.swift
//  LearningTexture
//
//  Created by Jalil Fierro on 15/11/21.
//

import AsyncDisplayKit

class FeedImageNode: BaseNode {
    
    var imageNode = ASNetworkImageNode()
    
    override init() {
        super.init()
        setup()
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        return ASInsetLayoutSpec(insets: .zero, child: imageNode)
    }
    
    private func setup() {
        imageNode.backgroundColor = .purple
        imageNode.style.preferredSize.height = UIScreen.main.bounds.width / 2
        imageNode.style.preferredSize.width = UIScreen.main.bounds.width
    }
}