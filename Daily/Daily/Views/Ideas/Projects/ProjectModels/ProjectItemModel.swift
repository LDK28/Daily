//
//  ProjectItemModel.swift
//  Daily
//
//  Created by julie on 12.12.2020.
//

import UIKit

struct ProjectItem: Codable {
    var id: UUID
    var headerTitle: String
    var subItems: [ProjectSubitem]
    
    init(headerTitle: String, subItems: [ProjectSubitem]) {
        self.headerTitle = headerTitle
        self.subItems = subItems
        self.id = UUID()
    }
    
    init(copiedItem: ProjectItem) {
        self.headerTitle = copiedItem.headerTitle
        self.subItems = copiedItem.subItems
        self.id = copiedItem.id
    }
}
