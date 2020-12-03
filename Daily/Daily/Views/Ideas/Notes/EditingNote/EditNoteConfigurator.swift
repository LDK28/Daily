//
//  EditNoteConfigurator.swift
//  Daily
//
//  Created by Арсений Токарев on 03.12.2020.
//

import UIKit

class EditNoteModule {
	static func build() -> EditNoteVC {
		let viewController = EditNoteVC()
		let interactor = EditNoteInteractor()
		let presenter = EditNotePresenter()
		let router = EditNoteRouter()
		
		interactor.presenter = presenter
		presenter.viewController = viewController
		router.viewController = viewController
		router.dataStore = interactor
		viewController.router = router
		viewController.interactor = interactor

		return viewController
	}
}
