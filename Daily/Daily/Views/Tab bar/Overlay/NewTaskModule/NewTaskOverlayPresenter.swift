//
//  NewTaskOverlayPresenter.swift
//  Daily
//
//  Created by Арсений Токарев on 05.11.2020.
//

import UIKit

protocol NewTaskOverlayPresenterProtocol {
	//more to come
}

class NewTaskOverlayPresenter: NewTaskOverlayPresenterProtocol {
	weak var view: NewTaskOverlayViewProtocol?
	let model: NewTaskViewModel

	init(model: NewTaskViewModel, view: NewTaskOverlayViewProtocol) {
		self.model = model
		self.view = view
	}
}
