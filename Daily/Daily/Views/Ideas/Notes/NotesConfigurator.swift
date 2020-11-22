//
//  NotesConfigurator.swift
//  Daily
//
//  Created by Арсений Токарев on 19.11.2020.
//

import UIKit

class NotesModule {
	static func build(with dataSource: [NotesCellViewModel] ) -> NotesVC {
		
		let viewController = NotesVC()
		let presenter = NotesPresenter(viewController: viewController)
		let interactor = NotesInteractor(presenter: presenter, dataSource: dataSource)
		let router = NotesRouter(viewController: viewController, dataStore: interactor)
		viewController.router = router
		viewController.interactor = interactor
		return viewController
	}
}
