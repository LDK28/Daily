//
//  NewNoteOverlayConfigurator.swift
//  Daily
//
//  Created by Арсений Токарев on 17.11.2020.
//

import UIKit

class NewNoteOverlayModule {
	static func build() -> NewNoteOverlayVC {
		let dataSource = NewNoteOverlayDataSource()
		let viewController = NewNoteOverlayVC()
		let presenter = OverlayPresenter(viewController: viewController, dataSource: dataSource)
		let interactor = NewNoteOverlayInteractor(presenter: presenter, dataSource: dataSource)
		let router = NewNoteOverlayRouter()
		router.viewController = viewController
		router.dataStore = interactor
		viewController.interactor = interactor
		viewController.router = router
		return viewController
	}
}
