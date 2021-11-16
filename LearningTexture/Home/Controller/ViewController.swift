//
//  ViewController.swift
//  LearningTexture
//
//  Created by Jalil Fierro on 15/11/21.
//

import AsyncDisplayKit

class ViewController: ASDKViewController<BaseNode> {
    
    var newsFeed: HomePresentation!

    override init() {
        super.init(node: BaseNode())
        newsFeed = HomePresentation()
        
        // node is the equivalent of self.view
        node.addSubnode(newsFeed)
        node.backgroundColor = .white
        
        /// https://texturegroup.org/docs/layout2-layoutspec-types.html#asinsetlayoutspec
        node.layoutSpecBlock = { node, constrainedSize in
            // Basically this means fullscreen
            return ASInsetLayoutSpec(insets: .zero, child: self.newsFeed)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

