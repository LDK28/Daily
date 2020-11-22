//
//  DailyTabBarConfigurator.swift
//  Daily
//
//  Created by Арсений Токарев on 22.11.2020.
//

import UIKit

class DailyTabBarModule {
	static func build() -> DailyTabBarVC {
		//let dataSource = ...
		let viewController = DailyTabBarVC()
		let interactor = DailyTabBarInteractor()
		
		let presenter = DailyTabBarPresenter()
		//presenter.dataSource = dataSource
		presenter.viewController = viewController
		
		let router = DailyTabBarRouter()
		router.viewController = viewController
		viewController.router = router
		
		//interactor.dataSource = dataSource
		interactor.presenter = presenter
		router.dataStore = interactor
		viewController.interactor = interactor
		
		
		
		return viewController
	}
}
