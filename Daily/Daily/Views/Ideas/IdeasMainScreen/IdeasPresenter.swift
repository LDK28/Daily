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
    func present(doneProjects: Int, missedProjects: Int) {
        viewController?.cellsToDisplay.removeAll()
        viewController?.cellsToDisplay = [
            IdeasCellViewModel(title: "Notes",
                                       cellType: IdeasCell.self),
            IdeasCellViewModel(title: "Projects",
                                       doneProjects: doneProjects,
                                       missedProjects: missedProjects,
                                       cellType: IdeasCell.self),
            
            RecentActionsViewModel(headerLabelText: "Recent Actions",
                                   recentActions: [],
                                   cellType: RecentActionsCell.self)
        ]
        viewController?.display()
    }
}
