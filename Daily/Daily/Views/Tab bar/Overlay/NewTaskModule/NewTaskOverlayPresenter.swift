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
	let dataSource: DailyDataSource
	
	init(dataSource: DailyDataSource, view: NewTaskOverlayDisplayLogic) {
		self.dataSource = dataSource
		self.view = view
	}
}


// MARK: - Presenter Protocol
extension NewTaskOverlayPresenter: NewTaskOverlayPresentationLogic {
	func presentData() {
		//let a = dataSource
		view?.display(data: dataSource)
	}
}
