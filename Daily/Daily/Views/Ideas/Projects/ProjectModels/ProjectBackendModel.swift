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
    var items: [ProjectItem]
    
    static func ==(lhs: ProjectBackendModel, rhs: ProjectBackendModel) -> Bool {
        return lhs.projectID == rhs.projectID
    }
    
    init(title: String, items: [ProjectItem] = []) {
        self.projectID = UUID()
        self.title = title
        self.items = items
    }
    
    init(model: ProjectBackendModel) {
        self.title = model.title
        self.projectID = model.projectID
        self.items = model.items
    }
}

extension Array where Element == ProjectBackendModel {
    mutating func remove(at indices: [Int]) -> [ProjectBackendModel] {
        self = self
            .enumerated()
            .filter { !indices.contains($0.offset) }
            .map { $0.element }
        return self
    }
}
