//
//  StoryFeedCell.swift
//  LearningTexture
//
//  Created by Jalil Fierro on 15/11/21.
//

import AsyncDisplayKit

class StoryFeedCell: BaseCellNode {
    
    var imageNode = ASNetworkImageNode()
    var nameNode = ASTextNode()
    
    override init() {
        super.init()
        setup()
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        return ASStackLayoutSpec(direction: .vertical, spacing: 6, justifyContent: .start, alignItems: .center, children: [imageNode, nameNode])
    }
    
    func populate(story: Stories?, isWatched: Bool){
        nameNode.attributedText = NSAttributedString(string: story?.user.username ?? "Unknown User", attributes: [NSAttributedString.Key.foregroundColor: UIColor.label, NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 10)])
        imageNode.url = URL(string: story?.user.profileIcon ?? "")
        let colour = isWatched ? UIColor.lightGray : UIColor.red
        imageNode.imageModificationBlock = ASImageNodeRoundBorderModificationBlock(5.0, colour)
    }
    
    private func setup() {
        let cornerRadius: CGFloat = 63.0
        nameNode.maximumNumberOfLines = 1
        imageNode.backgroundColor = .white
        imageNode.style.preferredSize = CGSize(width: 63, height: 63)
        imageNode.cornerRadius = cornerRadius/2
    }
}
