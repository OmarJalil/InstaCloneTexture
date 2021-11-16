//
//  StoryFeedDataSource.swift
//  LearningTexture
//
//  Created by Jalil Fierro on 15/11/21.
//

import AsyncDisplayKit

class StoryFeedDataSource: NSObject, ASCollectionDataSource {
    
    private struct Sections {
        static let CreateStory = 0
        static let UnwatchedStories = 1
        static let WatchedStories = 2...Int.max
    }
    
    var myUser: User?
    var unwatchedStories: [Stories]?
    var watchedStories: [Stories]?
    
    func setStoriesData(dataSource: [Stories]?, myUser: User?) {
        self.unwatchedStories = dataSource?.filter{ story in story.isWatched == false }
        self.watchedStories = dataSource?.filter{ story in story.isWatched == true }
        self.myUser = myUser
    }
    
    func numberOfSections(in collectionNode: ASCollectionNode) -> Int {
        return 3
    }
    
    func collectionNode(_ collectionNode: ASCollectionNode, numberOfItemsInSection section: Int) -> Int {
        
        if section == 0 {
            return 1
        }
        
        if section == 1 {
            return self.unwatchedStories?.count ?? 0
        }
        
        return self.watchedStories?.count ?? 0
    }
    
    func collectionNode(_ collectionNode: ASCollectionNode, nodeBlockForItemAt indexPath: IndexPath) -> ASCellNodeBlock {
        return { [weak self] in
            
            switch indexPath.section {
            case Sections.CreateStory:
                let cell = UserStoryCell()
                cell.populateUser(user: self?.myUser)
                return cell
                
            case Sections.UnwatchedStories:
                let story = self?.unwatchedStories?[indexPath.item]
                let cell = StoryFeedCell()
                cell.populate(story: story, isWatched: false)
                return cell
                
            case Sections.WatchedStories:
                let story = self?.watchedStories?[indexPath.item]
                let cell = StoryFeedCell()
                cell.populate(story: story, isWatched: true)
                return cell
                
            default:
                return ASCellNode()
            }
        }
    }
}
