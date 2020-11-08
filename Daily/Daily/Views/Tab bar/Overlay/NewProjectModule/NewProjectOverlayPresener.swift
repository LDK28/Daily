//
//  NewProjectOverlayPresener.swift
//  Daily
//
//  Created by Арсений Токарев on 08.11.2020.
//

import UIKit


protocol NewProjectOverlayPresentationLogic {
	func presentData()
}

class NewProjectOverlayPresenter {
	weak var view: NewProjectOverlayDisplayLogic?
	let dataSource: NewProjectOverlayDataSource
	
	init(dataSource: NewProjectOverlayDataSource, view: NewProjectOverlayDisplayLogic) {
		self.dataSource = dataSource
		self.view = view
	}
}


// MARK: - Presenter Protocol
extension NewProjectOverlayPresenter: NewProjectOverlayPresentationLogic {
	func presentData() {
		view?.display(data: dataSource)
	}
}
