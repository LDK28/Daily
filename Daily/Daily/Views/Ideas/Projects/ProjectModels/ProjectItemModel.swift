//
//  ProjectItemModel.swift
//  Daily
//
//  Created by julie on 12.12.2020.
//

import UIKit

class ProjectItem: Codable {
    var itemID: UUID
    var headerTitle: String
    var isDone: Bool
    var subItems: [ProjectSubitem]
    
    init(headerTitle: String, isDone: Bool, subItems: [ProjectSubitem] = []) {
        self.headerTitle = headerTitle
        self.isDone = isDone
        self.subItems = subItems
        self.itemID = UUID()
    }
    
    init(copiedItem: ProjectItem) {
        self.headerTitle = copiedItem.headerTitle
        self.isDone = copiedItem.isDone
        self.subItems = copiedItem.subItems
        self.itemID = copiedItem.itemID
    }
}
