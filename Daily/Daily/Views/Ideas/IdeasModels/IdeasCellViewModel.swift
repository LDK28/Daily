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
    
    init(title: String, hasStatistics: Bool = false, doneProjects: Int? = nil, missedProjects: Int? = nil) {
        self.title = title
        self.hasStatistics = hasStatistics
        self.doneProjects = doneProjects
        self.missedProjects = missedProjects
    }
}
