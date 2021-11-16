//
//  HomeDataSource.swift
//  LearningTexture
//
//  Created by Jalil Fierro on 15/11/21.
//

import AsyncDisplayKit
import Foundation

class HomeDataSource: NSObject, ASTableDataSource {
    
    private var dataSource: BaseDataSource?
    var reloadTableView: (() -> Void)?
    
    func numberOfSections(in tableNode: ASTableNode) -> Int {
        return 2
    }
    
    func tableNode(_ tableNode: ASTableNode, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? 1 : dataSource?.newsFeed?.count ?? 0
    }
    
    func tableNode(_ tableNode: ASTableNode, nodeForRowAt indexPath: IndexPath) -> ASCellNode {
        
        if indexPath.section == 0 {
            let cell = ASCellNode()
            return cell
        }
        
        let feed = dataSource?.newsFeed?[indexPath.row]
        let cell = NewsFeedCell(feed: feed)
        return cell
    }
    
    func fetchData() {
        
        dataSource = Bundle.main.decode(BaseDataSource.self, from: "instaClone.json")
        
        if let _ = dataSource {
            reloadTableView?()
        }
    }
}
