//
//  MainPageRouter.swift
//  Daily
//
//  Created by Арсений Токарев on 08.12.2020.
//  Copyright (c) 2020. All rights reserved.

import UIKit
import FirebaseAuth

class MainPageRouter: ProfileRouter, MainPageDataPassing {
	weak var dataStore: MainPageDataStore?
	
	init(viewController: MainPageVC?, dataStore: MainPageDataStore?) {
		super.init()
		self.viewController = viewController
		self.dataStore = dataStore
	}
}

extension MainPageRouter: MainPageRoutingLogic {
	func logOut() {
		(viewController?.tabBarController as? DailyTabBarVC)?.coordinator?.logout()
	}
}
