//
//  NewNoteOverlayInteractor.swift
//  Daily
//
//  Created by Арсений Токарев on 08.11.2020.
//

import UIKit

protocol NewNoteOverlayBusinessLogic {
	func fetchCells()
}

class NewNoteOverlayInteractor {
	let presenter: NewNoteOverlayPresentationLogic?
	let dataSource: NewNoteOverlayDataSource
	
	init(dataSource: NewNoteOverlayDataSource, presenter: NewNoteOverlayPresentationLogic) {
		self.presenter = presenter
		self.dataSource = dataSource
	}
}

extension NewNoteOverlayInteractor: NewNoteOverlayBusinessLogic {
	func fetchCells() {
		presenter?.present()
	}
	
}
