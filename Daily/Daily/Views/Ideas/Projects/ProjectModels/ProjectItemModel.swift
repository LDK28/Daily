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
    
    init(headerTitle: String, isDone: Bool) {
        self.headerTitle = headerTitle
        self.isDone = isDone
        self.itemID = UUID()
    }
    
    init(copiedItem: ProjectItem) {
        self.headerTitle = copiedItem.headerTitle
        self.isDone = copiedItem.isDone
        self.itemID = copiedItem.itemID
    }
}
