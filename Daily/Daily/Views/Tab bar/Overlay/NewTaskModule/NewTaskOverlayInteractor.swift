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
	var presenter: NewTaskOverlayPresentationLogic? 

}

// MARK: - Interactor Protocol

extension NewTaskOverlayInteractor: NewTaskOverlayBusinessLogic {
	func fetchCells() {
		presenter?.presentData()
	}
}
