//
//  DailyTabBarProtocols.swift
//  Daily
//
//  Created by Арсений Токарев on 22.11.2020.
//

import UIKit

protocol DailyTabBarDisplayLogic: AnyObject {
	func askRouterToNavigateToLoginScreen()
}

protocol DailyTabBarBusinessLogic {
	func checkUserLoginStatus()
	
}

protocol DailyTabBarDataStore: AnyObject {
	var userData: CurrentUser? { get set }
}

protocol DailyTabBarPresentationLogic {
	func prepareViewForRoutingToLoginScreen()
	func present()
	
}

protocol DailyTabBarRoutingLogic {
	func navigateToLoginScreen()
}

protocol DailyTabBarDataPassing {
	var dataStore: DailyTabBarDataStore? { get }
}
