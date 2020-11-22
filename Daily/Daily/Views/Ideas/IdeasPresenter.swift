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
    func present(ideasCells: [IdeasCellViewModel]) {
            viewController?.cellsToDisplay.removeAll()
            for cellViewModel in ideasCells {
                if let cell = (viewController as? IdeasVC)?.tableView.dequeueReusableCell(withIdentifier: IdeasCell.cellIdentifier) as?  IdeasCell{
                    cell.viewModel = cellViewModel
                    viewController?.cellsToDisplay.append(cell)
                }
            }
            viewController?.display()
        }
}
