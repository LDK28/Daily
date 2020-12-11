//
//  DailyTabBarConfigurator.swift
//  Daily
//
//  Created by Арсений Токарев on 22.11.2020.
//

import UIKit

class DailyTabBarModule {
	static func build() -> DailyTabBarVC {
		let viewController = DailyTabBarVC()
		let presenter = DailyTabBarPresenter(viewController: viewController)
		let interactor = DailyTabBarInteractor(presenter: presenter, userData: nil)
		let router = DailyTabBarRouter(viewController: viewController, dataStore: interactor)
		
		viewController.router = router
		viewController.interactor = interactor

		return viewController
	}
}
