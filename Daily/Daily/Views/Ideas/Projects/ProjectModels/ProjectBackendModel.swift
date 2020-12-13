//
//  ProjectBackendModel.swift
//  Daily
//
//  Created by julie on 12.12.2020.
//

import UIKit
import Firebase

class ProjectBackendModel: Codable {
    var projectID: UUID
    var title: String
//    var items: [ProjectItem] = [
//        ProjectItem(headerTitle: "Test",
//                    subItems: [
//                        ProjectSubitem(title: "testwqdqwdqwdqwd",
//                                       isChecked: false,
//                                       assignedDate: [:])
//                    ])
//    ]
    var items = [ProjectItem]()
    
    static func ==(lhs: ProjectBackendModel, rhs: ProjectBackendModel) -> Bool {
        return lhs.projectID == rhs.projectID
    }
    
    init(title: String) {
        self.projectID = UUID()
        self.title = title
    }
    
    init(model: ProjectBackendModel) {
        self.title = model.title
        self.projectID = model.projectID
    }
    
}
