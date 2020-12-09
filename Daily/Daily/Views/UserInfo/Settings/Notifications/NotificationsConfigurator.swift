//
//  NotificationsConfigurator.swift
//  Daily
//
//  Created by Арсений Токарев on 09.12.2020.
//

import UIKit

class NotificationsModule {
	static func build() -> NotificationsVC {
		let viewController = NotificationsVC()
		let presenter = NotificationsPresenter(viewController: viewController)
		let interactor = NotificationsInteractor(presenter: presenter)
		let router = NotificationsRouter(viewController: viewController, dataStore: interactor)
		
		viewController.router = router
		viewController.interactor = interactor
		
		return viewController
	}
}
