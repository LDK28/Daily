//
//  ProfileSettingsConfigurator.swift
//  Daily
//
//  Created by Арсений Токарев on 08.12.2020.
//

import UIKit

class ProfileSettingsModule {
	static func build() -> ProfileSettingsVC {
		let viewController = ProfileSettingsVC()
		let presenter = ProfileSettingsPresenter(viewController: viewController)
		let interactor = ProfileSettingsInteractor(presenter: presenter)
		let router = ProfileSettingsRouter(viewController: viewController, dataStore: interactor)
		
		viewController.router = router
		viewController.interactor = interactor
		
		return viewController
	}
}
