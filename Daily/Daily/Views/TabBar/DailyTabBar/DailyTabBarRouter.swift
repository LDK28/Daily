//
//  DailyTabBarRouter.swift
//  Daily
//
//  Created by Арсений Токарев on 22.11.2020.
//  Copyright (c) 2020. All rights reserved.

import UIKit

class DailyTabBarRouter: DailyTabBarDataPassing {
	
	weak var viewController: DailyTabBarVC?
	weak var dataStore: DailyTabBarDataStore?
  
}

extension DailyTabBarRouter: DailyTabBarRoutingLogic {
	func navigateToLoginScreen() {
		let navController = UINavigationController(rootViewController: LoginVC())
		navController.modalPresentationStyle = .fullScreen
		viewController?.present(navController, animated: true, completion: nil)
	}
}
