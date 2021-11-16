//
//  HeaderNode.swift
//  LearningTexture
//
//  Created by Jalil Fierro on 15/11/21.
//

import AsyncDisplayKit
import UIKit


class HeaderNode: BaseNode {
    
    var profileImage = ASNetworkImageNode()
    var name = ASTextNode()
    var extrasButton = ASButtonNode()
    
    override init() {
        super.init()
        setup()
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        
        let profileImageWithleftPadding = ASInsetLayoutSpec(
            insets: UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 8),
            child: profileImage)
        
        let iconSpec = ASStackLayoutSpec(
            direction: .horizontal,
            spacing: 0,
            justifyContent: .end,
            alignItems: .end,
            children: [extrasButton])
        
        let extrasButtonWithRightPadding = ASInsetLayoutSpec(
            insets: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 16),
            child: iconSpec)
        extrasButtonWithRightPadding.style.flexGrow = 1
        
        let finalSpec = ASStackLayoutSpec(
            direction: .horizontal,
            spacing: 0,
            justifyContent: .start,
            alignItems: .center,
            children: [profileImageWithleftPadding, name, extrasButtonWithRightPadding])
        
        return finalSpec
    }
    
    private func setup() {
        
        profileImage.cornerRadius = 35 / 2
        profileImage.style.preferredSize = CGSize(width: 35, height: 35)
                
        let primative = ASPrimitiveTraitCollectionMakeDefault()
        let image = ASImageNodeTintColorModificationBlock(.black)(UIImage(named: "elipse")!, primative)
        extrasButton.setImage(image, for: .normal)
        extrasButton.style.preferredSize = CGSize(width: 10, height: 10)
    }
    
    public func populate(user: User?) {
       
        profileImage.url = URL(string: user?.profileIcon ?? "")
        name.attributedText = NSAttributedString(string: user?.username ?? "", attributes: [.font: UIFont.boldSystemFont(ofSize: 17),
                                                                                            .foregroundColor: UIColor.label])
    }
    
}
