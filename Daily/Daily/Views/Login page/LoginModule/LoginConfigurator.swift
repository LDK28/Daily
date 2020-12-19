//
//  LoginConfigurator.swift
//  Daily
//
//  Created by Арсений Токарев on 18.12.2020.
//

import UIKit

class LoginModule {
	static func build() -> LoginVC {
		let viewController = LoginVC()
		let presenter = LoginPresenter(viewController: viewController)
		let interactor = LoginInteractor(presenter: presenter)
		let router = LoginRouter(viewController: viewController, dataStore: interactor)
		
		viewController.router = router
		viewController.interactor = interactor
		
		return viewController
	}
}
