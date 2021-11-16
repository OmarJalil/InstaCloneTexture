//
//  HomePresentation.swift
//  LearningTexture
//
//  Created by Jalil Fierro on 15/11/21.
//

import AsyncDisplayKit

class HomePresentation: BaseNode {
    
    let table = ASTableNode()
    let dataSource = HomeDataSource()
    
    override init() {
        super.init()
        table.allowsSelection = false
        table.backgroundColor = .white
        table.dataSource = dataSource
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        return ASInsetLayoutSpec(insets: .zero, child: self.table)
    }
    
}

// MARK: - Delegate
extension HomePresentation: ASTableDelegate {
    
    // Asigns dynamic size to the cell based on the content and padding on the last cell
    func tableNode(_ tableNode: ASTableNode, constrainedSizeForRowAt indexPath: IndexPath) -> ASSizeRange {
        let width = UIScreen.main.bounds.width
        return ASSizeRangeMake(CGSize(width: width, height: 0), CGSize(width: width, height: .greatestFiniteMagnitude))
    }
}
