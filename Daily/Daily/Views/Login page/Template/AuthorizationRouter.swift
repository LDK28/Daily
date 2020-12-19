//
//  AuthorizationRouter.swift
//  Daily
//
//  Created by Арсений Токарев on 19.12.2020.
//  Copyright (c) 2020. All rights reserved.

import UIKit

class AuthorizationRouter {
	weak var viewController: AuthorizationVC?
  
	init(viewController: AuthorizationVC?) {
		self.viewController = viewController
	}
}

extension AuthorizationRouter: AuthorizationRoutingLogic {
	func navigateTo(_ destination: LoginNavigationDestination) {
		switch destination {
		case .signupScreen:
			viewController?.present(SignupVC(), animated: true, completion: nil)
		case .app :
			AppStatusSwitcher.shared.updateRootVC()
		case .loginScreen:
			viewController?.present(LoginModule.build(), animated: true, completion: nil)
		}
	}
}
