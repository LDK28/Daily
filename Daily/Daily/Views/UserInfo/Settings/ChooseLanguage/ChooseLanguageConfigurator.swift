//
//  ChooseLanguageConfigurator.swift
//  Daily
//
//  Created by Арсений Токарев on 09.12.2020.
//

import UIKit

class ChooseLanguageModule {
	static func build() -> ChooseLanguageVC {
		let viewController = ChooseLanguageVC()
		let presenter = ChooseLanguagePresenter(viewController: viewController)
		let interactor = ChooseLanguageInteractor(presenter: presenter)
		let router = ChooseLanguageRouter(viewController: viewController, dataStore: interactor)
		
		viewController.router = router
		viewController.interactor = interactor
		
		return viewController
	}
}
