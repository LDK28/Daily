//
//  IdeasPresenter.swift
//  Daily
//
//  Created by julie on 21.11.2020.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.

import UIKit

class IdeasPresenter: IdeasDataStore {
    var dataSource = IdeasDataSource()
    weak var tableView: UITableView?
        weak var viewController: IdeasDisplayLogic? {
            didSet {
                tableView = (viewController as? IdeasVC)?.tableView
            }
        }
}

extension IdeasPresenter: IdeasPresentationLogic {
    func present() {
        guard let cellViewModels = dataSource.ideasCellViewModels else { return }
        for cellViewModel in cellViewModels {
            if let cell = tableView?.dequeueReusableCell(withIdentifier: IdeasCell.cellIdentifier) as?  IdeasCell{
                cell.viewModel = cellViewModel
                viewController?.cellsToDisplay.append(cell)
            }
        }
        viewController?.display()
    }
}
