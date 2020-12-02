//
//  NewTaskOverlayConfigurator.swift
//  Daily
//
//  Created by Арсений Токарев on 17.11.2020.
//

import UIKit

class NewTaskOverlayModule {
	static func build() -> NewTaskOverlayVC {
		let dataSource = NewTaskOverlayDataSource()
		let viewController = NewTaskOverlayVC()
		let presenter = NewTaskOverlayPresenter(viewController: viewController, dataSource: dataSource)
		let interactor = NewTaskOverlayInteractor(presenter: presenter, dataSource: dataSource)
		let router = NewTaskOverlayRouter()
		router.viewController = viewController
		router.dataStore = interactor
		viewController.interactor = interactor
		viewController.router = router
		return viewController
	}
}
