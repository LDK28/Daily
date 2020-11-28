//
//  RecentActionsViewModel.swift
//  Daily
//
//  Created by julie on 25.11.2020.
//

import UIKit

struct RecentActionsViewModel {
    var headerLabelText: String
    var recentActions: [String]
    
    init(headerLabelText: String, recentActions: [String]) {
        self.headerLabelText = headerLabelText
        self.recentActions = recentActions
    }
}
