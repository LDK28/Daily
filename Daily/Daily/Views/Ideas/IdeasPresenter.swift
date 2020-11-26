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
    func present(buttonCells: [IdeasCellViewModel], recentActions: RecentActionsViewModel) {
        viewController?.buttonsCells.removeAll()
        for cellViewModel in buttonCells {
            if let cell = (viewController as? IdeasVC)?.tableView.dequeueReusableCell(withIdentifier: IdeasCell.cellIdentifier) as?  IdeasCell {
                cell.viewModel = cellViewModel
                viewController?.buttonsCells.append(cell)
            }
        }
        if let cell = (viewController as? IdeasVC)?.tableView.dequeueReusableCell(withIdentifier: RecentActionsCell.cellIdentifier) as? RecentActionsCell {
            cell.viewModel = recentActions
            viewController?.recentActionsCell = cell
        }
        viewController?.display()
    }
}
