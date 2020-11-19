//
//  NotesConfigurator.swift
//  Daily
//
//  Created by Арсений Токарев on 19.11.2020.
//

import UIKit

class NotesModule {
	static func build() -> NotesVC {
		//let dataSource = ...
		let viewController = NotesVC()
		let interactor = NotesInteractor()
		
		let presenter = NotesPresenter()
		//presenter.dataSource = dataSource
		presenter.viewController = viewController
		
		let router = NotesRouter()
		router.viewController = viewController
		viewController.router = router
		
		//interactor.dataSource = dataSource
		interactor.presenter = presenter
		router.dataStore = interactor
		viewController.interactor = interactor
		
		
		
		return viewController
	}
}
