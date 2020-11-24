//
//  IdeasCellViewModel.swift
//  Daily
//
//  Created by julie on 21.11.2020.
//

import UIKit

struct IdeasCellViewModel {
    var title: String
    var hasStatistics: Bool
    var doneProjects: Int?
    var missedProjects: Int?
    
    init(title: String) {
        self.title = title
        self.hasStatistics = false
    }
    
    init(title: String, doneProjects: Int? = 0, missedProjects: Int? = 0) {
        self.title = title
        self.hasStatistics = true
        self.doneProjects = doneProjects
        self.missedProjects = missedProjects
    }
}
