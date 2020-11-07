//
//  NewTaskOverlayPresenter.swift
//  Daily
//
//  Created by Арсений Токарев on 05.11.2020.
//

import UIKit

protocol NewTaskOverlayPresentationLogic {
	func presentData()
}

class NewTaskOverlayPresenter {
	weak var view: NewTaskOverlayDisplayLogic?
	let model: NewTaskViewModel

	init(model: NewTaskViewModel, view: NewTaskOverlayDisplayLogic) {
		self.model = model
		self.view = view
	}
}


// MARK: - Presenter Protocol
extension NewTaskOverlayPresenter: NewTaskOverlayPresentationLogic {
	func presentData() {
		
	}
}
