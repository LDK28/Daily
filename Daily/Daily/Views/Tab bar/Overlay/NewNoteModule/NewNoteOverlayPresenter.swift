//
//  NewNoteOverlayPresenter.swift
//  Daily
//
//  Created by Арсений Токарев on 08.11.2020.
//

import Foundation

protocol NewNoteOverlayPresentationLogic {
	func present()
}

class NewNoteOverlayPresenter {
	weak var view: NewNoteOverlayDisplayLogic?
	
	init(view: NewNoteOverlayDisplayLogic) {
		self.view = view
	}
}

extension NewNoteOverlayPresenter: NewNoteOverlayPresentationLogic {
	func present() {
		view?.display()
	}
}
