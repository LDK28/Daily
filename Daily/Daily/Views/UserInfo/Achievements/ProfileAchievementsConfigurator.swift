//
//  ProfileAchievementsConfigurator.swift
//  Daily
//
//  Created by Арсений Токарев on 08.12.2020.
//

import UIKit

class ProfileAchievementsModule {
	static func build() -> ProfileAchievementsVC {
		let viewController = ProfileAchievementsVC()
		let presenter = ProfileAchievementsPresenter(viewController: viewController)
		let interactor = ProfileAchievementsInteractor(presenter: presenter)
		let router = ProfileAchievementsRouter(viewController: viewController, dataStore: interactor)
		
		viewController.router = router
		viewController.interactor = interactor
		
		return viewController
	}
}
