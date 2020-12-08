//
//  MainPageRouter.swift
//  Daily
//
//  Created by Арсений Токарев on 08.12.2020.
//  Copyright (c) 2020. All rights reserved.

import UIKit
import FirebaseAuth

class MainPageRouter: MainPageDataPassing {
	
	weak var viewController: MainPageVC?
	weak var dataStore: MainPageDataStore?
	
	init(viewController: MainPageVC?, dataStore: MainPageDataStore?) {
		self.viewController = viewController
		self.dataStore = dataStore
	}
}

extension MainPageRouter: MainPageRoutingLogic {
	func navigateTo(viewController: UIViewController) {
		self.viewController?.navigationController?.pushViewController(viewController,
																	  animated: true)
	}
	
	func logOut() {
		(viewController?.tabBarController as? DailyTabBarVC)?.coordinator?.logout()
	}
}
