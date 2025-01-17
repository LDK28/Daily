//
//  IdeasCellViewModel.swift
//  Daily
//
//  Created by julie on 21.11.2020.
//

import UIKit

enum IdeasCellType {
    case notes, projects
}

struct IdeasCellViewModel: MainCellViewModel {
    
    var cellType: UITableViewCell.Type
    
    var buttonType: IdeasCellType
    var title: String
    var hasStatistics: Bool
    var doneProjects: Int?
    var missedProjects: Int?
    
    init(title: String, cellType: UITableViewCell.Type) {
        self.title = title
        self.hasStatistics = false
        self.cellType = cellType
        self.buttonType = .notes
    }
    
    init(title: String, doneProjects: Int? = 0, missedProjects: Int? = 0, cellType: UITableViewCell.Type) {
        self.title = title
        self.hasStatistics = true
        self.doneProjects = doneProjects
        self.missedProjects = missedProjects
        self.cellType = cellType
        self.buttonType = .projects
    }
}
