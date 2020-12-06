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
    
    func present() {
        
        viewController?.cellsToDisplay.removeAll()
        
        viewController?.cellsToDisplay = [
            IdeasCellViewModel(title: "Notes",
                                       cellType: IdeasCell.self),
            IdeasCellViewModel(title: "Projects",
                                       doneProjects: 0,
                                       missedProjects: 0,
                                       cellType: IdeasCell.self),
            
            RecentActionsViewModel(headerLabelText: "Recent Actions", recentActions: [" first", " second", " third"], cellType: RecentActionsCell.self)
        ]
        
        
        
        viewController?.display()
    }
}
