//
//  DailyTabBarPresenter.swift
//  Daily
//
//  Created by Арсений Токарев on 22.11.2020.
//  Copyright (c) 2020. All rights reserved.

import UIKit

class DailyTabBarPresenter: DailyTabBarDataStore {
	weak var viewController: DailyTabBarDisplayLogic?
	
}

extension DailyTabBarPresenter: DailyTabBarPresentationLogic {
	func updatePlusConfiguration() {
		
	}
	
	func prepareViewForRoutingToLoginScreen() {
		viewController?.askRouterToNavigateToLoginScreen()
	}
}
