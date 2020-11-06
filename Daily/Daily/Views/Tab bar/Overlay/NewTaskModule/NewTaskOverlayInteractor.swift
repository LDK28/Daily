//
//  NewTaskOverlayInteractor.swift
//  Daily
//
//  Created by Арсений Токарев on 05.11.2020.
//

import UIKit

protocol NewTaskOverlayInteractorProtocol {
	
}

class NewTaskOverlayInteractor: NewTaskOverlayInteractorProtocol {
	let presenter: NewTaskOverlayPresenter
	let model: NewTaskViewModel
	
	init(model: NewTaskViewModel, presenter: NewTaskOverlayPresenter) {
		self.model = model
		self.presenter = presenter
	}
}
