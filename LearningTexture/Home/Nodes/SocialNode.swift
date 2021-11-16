//
//  SocialNode.swift
//  LearningTexture
//
//  Created by Jalil Fierro on 15/11/21.
//

import AsyncDisplayKit

class SocialNode: BaseNode {
    
    let shareButtonNode = ASButtonNode()
    let likeButtonNode = ASButtonNode()
    let commentButtonNode = ASButtonNode()
    let bookmarkButtonNode = ASButtonNode()
    
    var likesTextNode = ASTextNode()
    var likesCount: Int?
    
    override init() {
        super.init()
        setup()
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        
        let hStackBookmark = ASStackLayoutSpec(
            direction: .horizontal,
            spacing: 0,
            justifyContent: .end,
            alignItems: .end,
            children: [bookmarkButtonNode])
        let bookmarkPadding = ASInsetLayoutSpec(insets: .init(top: 0, left: 0, bottom: 0, right: 8), child: hStackBookmark)
        bookmarkPadding.style.flexGrow = 1
        
        let hStackSocialsButtons = ASStackLayoutSpec(
            direction: .horizontal,
            spacing: 10,
            justifyContent: .start,
            alignItems: .stretch,
            children: [likeButtonNode, commentButtonNode, shareButtonNode, bookmarkPadding])
        
        let hStackSocialsPadding = ASInsetLayoutSpec(insets: .init(top: 10, left: 10, bottom: 10, right: 0), child: hStackSocialsButtons)
        
        var elements = [ASLayoutElement]()
        elements.append(hStackSocialsPadding)
        
        if let likes = likesCount, likes > 0 {
            let localInset = ASInsetLayoutSpec(insets: .init(top: 0, left: 10, bottom: 10, right: 0), child: likesTextNode)
            elements.append(localInset)
        }
        
        let vStack = ASStackLayoutSpec(
            direction: .vertical,
            spacing: 6,
            justifyContent: .start,
            alignItems: .stretch,
            children: elements)
        
        return vStack
    }
    
    override func asyncTraitCollectionDidChange(withPreviousTraitCollection previousTraitCollection: ASPrimitiveTraitCollection) {
        super.asyncTraitCollectionDidChange(withPreviousTraitCollection: previousTraitCollection)
        setupDynamicColors()
    }
    
    private func setup() {
        shareButtonNode.style.preferredSize = CGSize(width: 30, height: 30)
        likeButtonNode.style.preferredSize = CGSize(width: 30, height: 30)
        commentButtonNode.style.preferredSize = CGSize(width: 30, height: 30)
        bookmarkButtonNode.style.preferredSize = CGSize(width: 30, height: 30)
        
        setupDynamicColors()
    }
    
    private func setupDynamicColors() {
        
        if let color = colorSet {
            
            let primative = ASPrimitiveTraitCollectionMakeDefault()
            
            let imageLike = ASImageNodeTintColorModificationBlock(color)(UIImage(named: "like")!, primative)
            likeButtonNode.setImage(imageLike, for: .normal)
            
            let imageComment = ASImageNodeTintColorModificationBlock(color)(UIImage(named: "comment")!, primative)
            commentButtonNode.setImage(imageComment, for: .normal)
            
            let imageShare = ASImageNodeTintColorModificationBlock(color)(UIImage(named: "share")!, primative)
            shareButtonNode.setImage(imageShare, for: .normal)
            
            let imageBookmark = ASImageNodeTintColorModificationBlock(color)(UIImage(named: "bookmark")!, primative)
            bookmarkButtonNode.setImage(imageBookmark, for: .normal)
            
        }
    }
    
    func populate(feed: NewsFeed) {
        guard let numberOfLikes = feed.likes else { return }
        likesCount = feed.likes ?? 0
        let stringValueForLikes = numberOfLikes > 1 ? "\(numberOfLikes) likes" : "1 like"
        likesTextNode.attributedText = NSAttributedString(string: stringValueForLikes, attributes: [.foregroundColor: UIColor.label,
                                                                                                        .font: UIFont.boldSystemFont(ofSize: 13)])
    }
}

