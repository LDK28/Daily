//
//  ProjectBackendModel.swift
//  Daily
//
//  Created by julie on 12.12.2020.
//

import UIKit
import Firebase

class ProjectBackendModel: Codable {
<<<<<<< HEAD
	var projectID: UUID
=======
    var projectID: UUID
>>>>>>> a4189bef4679f8f914180c8c7b947d95dd8bbd97
    var title: String
    var items: [ProjectItem]
    
    static func ==(lhs: ProjectBackendModel, rhs: ProjectBackendModel) -> Bool {
        return lhs.projectID == rhs.projectID
    }
    
    init(title: String, items: [ProjectItem] = []) {
        self.projectID = UUID()
        self.title = title
<<<<<<< HEAD
		self.projectID = UUID()
=======
        self.items = items
>>>>>>> a4189bef4679f8f914180c8c7b947d95dd8bbd97
    }
    
    init(model: ProjectBackendModel) {
        self.title = model.title
<<<<<<< HEAD
		self.projectID = model.projectID
=======
        self.projectID = model.projectID
        self.items = model.items
>>>>>>> a4189bef4679f8f914180c8c7b947d95dd8bbd97
    }
    
}
