//
//  RecentActionsViewModel.swift
//  Daily
//
//  Created by julie on 25.11.2020.
//

import UIKit

struct RecentActionsViewModel: MainCellViewModel {
    
    var cellType: UITableViewCell.Type
    var headerLabelText: String
    var recentActions: [String]
    
    init(headerLabelText: String, recentActions: [String], cellType: UITableViewCell.Type) {
        self.headerLabelText = headerLabelText
        self.recentActions = recentActions
        self.cellType = cellType
    }
}
