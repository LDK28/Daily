//
//  NewTaskOverlayPresenter.swift
//  Daily
//
//  Created by Арсений Токарев on 05.11.2020.
//

import UIKit

protocol NewTaskOverlayPresentationLogic {
	func present(data: OverlayDataSource)
}

class NewTaskOverlayPresenter {
	weak var view: OverlayDisplayLogic?
	weak var tableView: UITableView?
	
	init(view: OverlayDisplayLogic) {
		self.view = view
		if let tableView = (view as? NewTaskOverlayVC)?.tableView {
			self.tableView = tableView
		}
	}
}


// MARK: - Presenter Protocol
extension NewTaskOverlayPresenter: NewTaskOverlayPresentationLogic {
	func present(data: OverlayDataSource) {
		view?.display(cells: fillCells(from: data, in: tableView))
	}
}
