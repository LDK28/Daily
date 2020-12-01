//
//  NewProjectOverlayConfigurator.swift
//  Daily
//
//  Created by Арсений Токарев on 17.11.2020.
//

import UIKit

class NewProjectOverlayModule {
	static func build() -> NewProjectOverlayVC {
		let dataSource = NewProjectOverlayDataSource()
		
		let viewController = NewProjectOverlayVC()
		let interactor = NewProjectOverlayInteractor()
		
		let presenter = NewProjectOverlayPresenter()
		presenter.dataSource = dataSource
		presenter.viewController = viewController
		
		let router = NewProjectOverlayRouter()
		router.viewController = viewController
		viewController.router = router
		
		interactor.dataSource = dataSource
		interactor.presenter = presenter
		router.dataStore = interactor
		viewController.interactor = interactor
		
		
		
		return viewController
	}
}
