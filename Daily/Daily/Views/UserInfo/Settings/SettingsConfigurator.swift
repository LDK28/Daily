//
//  ProfileSettingsConfigurator.swift
//  Daily
//
//  Created by Арсений Токарев on 08.12.2020.
//

import UIKit

class SettingsModule {
	static func build() -> SettingsVC {
		let viewController = SettingsVC()
		let presenter = SettingsPresenter(viewController: viewController)
		let interactor = SettingsInteractor(presenter: presenter)
		let router = SettingsRouter(viewController: viewController, dataStore: interactor)
		
		viewController.router = router
		viewController.interactor = interactor
		
		return viewController
	}
}
