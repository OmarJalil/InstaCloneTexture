//
//  UserStoryCell.swift
//  LearningTexture
//
//  Created by Jalil Fierro on 15/11/21.
//

import AsyncDisplayKit

class UserStoryCell: StoryFeedCell {
    
    var addButton = ASButtonNode()
    
    override init() {
        super.init()
        setupNodes()
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let cornerSpec = ASCornerLayoutSpec(child: imageNode, corner: addButton, location: .bottomRight)
         // Slightly shift center of badge inside of avatar.
        cornerSpec.offset = CGPoint(x: -10, y: -10)
        return ASStackLayoutSpec(direction: .vertical, spacing: 6, justifyContent: .start, alignItems: .center, children: [cornerSpec, nameNode])
    }
    
    func populateUser(user: User?) {
        imageNode.url = URL(string: user?.profileIcon ?? "")
        nameNode.attributedText = NSAttributedString(string: user?.username ?? "Unknown User", attributes: [NSAttributedString.Key.foregroundColor: UIColor.label, NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 10)])
    }
    
    private func setupNodes() {
        addButton.backgroundColor = UIColor(hexString: "00008b", alpha: 1)
        addButton.setTitle("+", with: UIFont.boldSystemFont(ofSize: 15), with: .white, for: .normal)
        addButton.borderColor = UIColor.white.cgColor
        addButton.borderWidth = 1.5
        addButton.style.preferredSize = CGSize(width: 20, height: 20)
        addButton.cornerRadius = 20/2
    }
}
