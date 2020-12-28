//
//  CalendarConfigurator.swift
//  Daily
//
//  Created by julie on 28.12.2020.
//

import UIKit

class CalendarModule {
	static func build() -> CalendarVC {
		//let dataSource = ...
		let viewController = CalendarVC()
		let interactor = CalendarInteractor()
		
		let presenter = CalendarPresenter()
		//presenter.dataSource = dataSource
		presenter.viewController = viewController
		
		let router = CalendarRouter()
		router.viewController = viewController
		viewController.router = router
		
		//interactor.dataSource = dataSource
		interactor.presenter = presenter
		router.dataStore = interactor
		viewController.interactor = interactor
		
		
		
		return viewController
	}
}
