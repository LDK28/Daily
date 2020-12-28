//
//  IdeasPresenter.swift
//  Daily
//
//  Created by julie on 21.11.2020.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.

import UIKit

class IdeasPresenter {
    
    private weak var viewController: IdeasDisplayLogic?
        
    init(viewController: IdeasDisplayLogic?) {
        self.viewController = viewController
    }
}

extension IdeasPresenter: IdeasPresentationLogic {
    func present(doneProjects: Int, missedProjects: Int, recents: [String]) {
        viewController?.cellsToDisplay.removeAll()
        var recentActions = [String]()
        for projectName in recents.reversed() {
            recentActions.append(" You've finished " + projectName)
        }
        if recentActions.count == 0 {
            recentActions.append(" No finished projects ")
        }
        viewController?.cellsToDisplay = [
            IdeasCellViewModel(title: "Notes",
                                       cellType: IdeasCell.self),
            IdeasCellViewModel(title: "Projects",
                                       doneProjects: doneProjects,
                                       missedProjects: missedProjects,
                                       cellType: IdeasCell.self),
            RecentActionsViewModel(headerLabelText: "Recent Actions",
                                   recentActions: recentActions,
                                   cellType: RecentActionsCell.self)
        ]
        viewController?.display()
    }
}
