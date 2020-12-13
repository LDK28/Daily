//
//  ProjectSubitemModel.swift
//  Daily
//
//  Created by julie on 12.12.2020.
//

import UIKit

class ProjectSubitem: Codable {
    var id: UUID
    var title: String
    var isChecked: Bool
    var assignedDate: [String : Date]
    
    init(title: String, isChecked: Bool, assignedDate: [String : Date]) {
        self.title = title
        self.isChecked = isChecked
        self.assignedDate = assignedDate
        self.id = UUID()
    }
    
    init(copiedSubItem: ProjectSubitem) {
        self.title = copiedSubItem.title
        self.isChecked = copiedSubItem.isChecked
        self.assignedDate = copiedSubItem.assignedDate
        self.id = copiedSubItem.id
    }
}
