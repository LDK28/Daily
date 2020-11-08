//
//  NewTaskOverlayInteractor.swift
//  Daily
//
//  Created by Арсений Токарев on 05.11.2020.
//

import UIKit

protocol NewTaskOverlayBusinessLogic {
	func fetchCells()
	func didTapDateCell()
}

class NewTaskOverlayInteractor {
	let presenter: NewTaskOverlayPresentationLogic?
	let dataSource: NewTaskOverlayDataSource
	
	init(dataSource: NewTaskOverlayDataSource, presenter: NewTaskOverlayPresentationLogic) {
		self.dataSource = dataSource
		self.presenter = presenter
	}
}

// MARK: - Interactor Protocol

extension NewTaskOverlayInteractor: NewTaskOverlayBusinessLogic {
	func didTapDateCell() {
		
	}
	
	func fetchCells() {
		presenter?.presentData()
	}
}
