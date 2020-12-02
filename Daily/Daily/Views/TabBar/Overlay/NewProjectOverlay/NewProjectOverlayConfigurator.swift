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
		let presenter = NewProjectOverlayPresenter(viewController: viewController, dataSource: dataSource)
		let interactor = NewProjectOverlayInteractor(presenter: presenter, dataSource: dataSource)
		let router = NewProjectOverlayRouter()
		router.viewController = viewController
		router.dataStore = interactor
		viewController.interactor = interactor
		viewController.router = router
		return viewController
	}
}
