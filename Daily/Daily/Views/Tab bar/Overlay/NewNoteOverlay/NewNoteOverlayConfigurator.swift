//
//  NewNoteOverlayConfigurator.swift
//  Daily
//
//  Created by Арсений Токарев on 17.11.2020.
//

import UIKit

class NewNoteOverlayModule {
	static func build() -> NewNoteOverlayVC {
		let dataSource = NewNoteOverlayDataSource(sectionViewModels: [])
		
		let viewController = NewNoteOverlayVC()
		let interactor = NewNoteOverlayInteractor()
		interactor.dataSource = dataSource
		
		let presenter = NewNoteOverlayPresenter()
		presenter.viewController = viewController
		presenter.dataSource = dataSource
		
		let router = NewNoteOverlayRouter()
		router.viewController = viewController
		viewController.router = router
		
		interactor.presenter = presenter
		router.dataStore = interactor
		viewController.interactor = interactor
		
		
		
		return viewController
	}
}
