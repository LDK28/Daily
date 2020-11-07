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
	let presenter: NewTaskOverlayPresenter?
	let model: NewTaskViewModel
	
	init(model: NewTaskViewModel, presenter: NewTaskOverlayPresenter) {
		self.model = model
		self.presenter = presenter
	}
}

// MARK: - Interactor Protocol

extension NewTaskOverlayInteractor: NewTaskOverlayBusinessLogic {
	func fetchCells() {
		presenter?.presentData()
	}
}
