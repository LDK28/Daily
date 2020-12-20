//
//  SignupConfigurator.swift
//  Daily
//
//  Created by Арсений Токарев on 19.12.2020.
//

import UIKit

class SignupModule {
	static func build() -> SignupVC {
		let viewController = SignupVC()
		let presenter = SignupPresenter(viewController: viewController)
		let interactor = SignupInteractor(presenter: presenter)
		let router = AuthorizationRouter(viewController: viewController)
		
		viewController.router = router
		viewController.interactor = interactor
		
		return viewController
	}
}
