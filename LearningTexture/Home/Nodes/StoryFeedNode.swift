//
//  StoryFeed.swift
//  LearningTexture
//
//  Created by Jalil Fierro on 15/11/21.
//

import AsyncDisplayKit

class StoryFeedNode: BaseCellNode, ASCollectionDelegate {
    
    var dataSource = StoryFeedDataSource()
    
    var collectionNode: ASCollectionNode = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: 60, height: 60)
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumLineSpacing = 0
        let collectionNode = ASCollectionNode(collectionViewLayout: flowLayout)
        collectionNode.showsHorizontalScrollIndicator = false
        collectionNode.backgroundColor = .clear
        return collectionNode
    }()
    
    init(stories: [Stories]?, user: User?) {
        super.init()
        setupNodes(stories: stories, user: user)
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        return ASInsetLayoutSpec(insets: .zero, child: collectionNode)
    }
    
    func collectionNode(_ collectionNode: ASCollectionNode, constrainedSizeForItemAt indexPath: IndexPath) -> ASSizeRange {
        
        return ASSizeRangeMake(CGSize(width:80, height: 0), CGSize(width: 80, height: CGFloat.greatestFiniteMagnitude))
    }
    
    private func setupNodes(stories: [Stories]?, user: User?) {
        dataSource.setStoriesData(dataSource: stories, myUser: user)
        collectionNode.dataSource = dataSource
        collectionNode.delegate = self
        let width = UIScreen.main.bounds.width
        collectionNode.style.preferredSize = CGSize(width: width, height: 120)
    }
    
}
