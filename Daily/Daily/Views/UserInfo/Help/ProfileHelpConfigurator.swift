//
//  ProfileHelpConfigurator.swift
//  Daily
//
//  Created by Арсений Токарев on 08.12.2020.
//

import UIKit

class ProfileHelpModule {
	static func build() -> ProfileHelpVC {
		let viewController = ProfileHelpVC()
		let presenter = ProfileHelpPresenter(viewController: viewController)
		let interactor = ProfileHelpInteractor(presenter: presenter)
		let router = ProfileHelpRouter(viewController: viewController, dataStore: interactor)
		
		viewController.router = router
		viewController.interactor = interactor
		
		return viewController
	}
}
