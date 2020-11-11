//
//  NewProjectOverlayInteractor.swift
//  Daily
//
//  Created by Арсений Токарев on 08.11.2020.
//

import UIKit

protocol NewProjectOverlayBusinessLogic {
	func fetchCells(in tableView: UITableView)
}

class NewProjectOverlayInteractor {
	let presenter: NewProjectOverlayPresentationLogic?
	let dataSource: NewProjectOverlayDataSource
	
	init(dataSource: NewProjectOverlayDataSource, presenter: NewProjectOverlayPresentationLogic) {
		self.dataSource = dataSource
		self.presenter = presenter
	}
}

extension NewProjectOverlayInteractor: NewProjectOverlayBusinessLogic {
	func fetchCells(in tableView: UITableView) {
		presenter?.present(data: dataSource, in: tableView)
	}
}
