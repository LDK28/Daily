//
//  NewProjectOverlayPresener.swift
//  Daily
//
//  Created by Арсений Токарев on 08.11.2020.
//

import UIKit


protocol NewProjectOverlayPresentationLogic {
	func present(data: NewProjectOverlayDataSource)
}

class NewProjectOverlayPresenter {
	weak var view: OverlayDisplayLogic?
	weak var tableView: UITableView?

	init(view: OverlayDisplayLogic) {
		self.view = view
		if let tableView = (view as? NewProjectOverlayVC)?.tableView {
			self.tableView = tableView
		}
	}
}


// MARK: - Presenter Protocol
extension NewProjectOverlayPresenter: NewProjectOverlayPresentationLogic {
	func present(data: NewProjectOverlayDataSource) {
		let viewData = fillCells(from: data, in: tableView)
		view?.display(cells: viewData)
	}
}
