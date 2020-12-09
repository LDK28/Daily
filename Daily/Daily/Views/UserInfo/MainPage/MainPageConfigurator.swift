//
//  MainPageConfigurator.swift
//  Daily
//
//  Created by Арсений Токарев on 08.12.2020.
//

import UIKit

class MainPageModule {
	static func build() -> MainPageVC {
		let viewController = MainPageVC()
		let presenter = MainPagePresenter(viewController: viewController)
		let interactor = MainPageInteractor(presenter: presenter)
		let router = MainPageRouter(viewController: viewController, dataStore: interactor)
		
		viewController.router = router
		viewController.interactor = interactor
		
		return viewController
	}
}
