//
//  ProjectBackendModel.swift
//  Daily
//
//  Created by julie on 12.12.2020.
//

import UIKit
import Firebase

class ProjectBackendModel: Codable {
    var items: [ProjectItem] = [
        ProjectItem(headerTitle: "Test",
                    subItems: [
                        ProjectSubitem(title: "testwqdqwdqwdqwd",
                                       isChecked: false,
                                       assignedDate: [:])
                    ])
    ]
}
