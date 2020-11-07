//
//  NewTaskOverlayInteractor.swift
//  Daily
//
//  Created by Арсений Токарев on 05.11.2020.
//

import UIKit

protocol NewTaskOverlayBusinessLogic {
	func fetchCells()
}

class NewTaskOverlayInteractor {
	let presenter: NewTaskOverlayPresentationLogic?
	let dataSource: DailyDataSource
	
	init(dataSource: DailyDataSource, presenter: NewTaskOverlayPresentationLogic) {
		self.dataSource = dataSource
		self.presenter = presenter
	}
}

// MARK: - Interactor Protocol

extension NewTaskOverlayInteractor: NewTaskOverlayBusinessLogic {
	func fetchCells() {
		presenter?.presentData()
	}
}
