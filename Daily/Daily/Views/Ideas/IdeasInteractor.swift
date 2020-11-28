//
//  IdeasInteractor.swift
//  Daily
//
//  Created by julie on 21.11.2020.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.

import UIKit

class IdeasInteractor: IdeasDataStore {
    
    internal var ideasCells: [IdeasCellViewModel]
    internal var recentActionsCell: RecentActionsViewModel
    private var presenter: IdeasPresentationLogic?
        
    init(presenter: IdeasPresentationLogic?, ideasCells: [IdeasCellViewModel], recentActionsCell: RecentActionsViewModel) {
        self.ideasCells = ideasCells
        self.recentActionsCell = recentActionsCell
        self.presenter = presenter
    }
}

extension IdeasInteractor: IdeasBusinessLogic {
    func fetchCells() {
        presenter?.present(buttonCells: ideasCells, recentActions: recentActionsCell)
    }
}
