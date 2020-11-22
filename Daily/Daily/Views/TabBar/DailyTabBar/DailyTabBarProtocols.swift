//
//  DailyTabBarProtocols.swift
//  Daily
//
//  Created by Арсений Токарев on 22.11.2020.
//

import UIKit

protocol DailyTabBarDisplayLogic: AnyObject {
	func askRouterToNavigateToLoginScreen()
//	var plusButton: PlusButton { get }
//	var blackoutView: UIView { get }
//	var overlayViewContoller: UIViewController? { get }
//	var newProjectButton: AddButton { get }
//	var newTaskButton: AddButton { get }
//	var newNoteButton: AddButton { get }
//	var addButtonsStackView: UIStackView { get }
}

protocol DailyTabBarBusinessLogic {
	func checkUserLoginStatus()
	
}

protocol DailyTabBarDataStore: AnyObject {
	
}

protocol DailyTabBarPresentationLogic {
	func prepareViewForRoutingToLoginScreen()
	
}

protocol DailyTabBarRoutingLogic {
	func navigateToLoginScreen()
}

protocol DailyTabBarDataPassing {
	var dataStore: DailyTabBarDataStore? { get }
}
