//
//  LoginRouter.swift
//  Daily
//
//  Created by Арсений Токарев on 18.12.2020.
//  Copyright (c) 2020. All rights reserved.

import UIKit

class LoginRouter: LoginDataPassing {
	
	weak var viewController: LoginVC?
	weak var dataStore: LoginDataStore?
  
	init(viewController: LoginVC?, dataStore: LoginDataStore?) {
		self.viewController = viewController
		self.dataStore = dataStore
	}
}

extension LoginRouter: LoginRoutingLogic {
	func navigateTo(_ destination: LoginNavigationDestination) {
		switch destination {
		case .signupScreen:
			viewController?.present(SignupVC(), animated: true, completion: nil)
		case .app :
			AppStatusSwitcher.shared.updateRootVC()
		}
	}
}
