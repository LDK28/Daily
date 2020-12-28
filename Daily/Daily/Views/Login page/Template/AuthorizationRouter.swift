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
		case .loginScreen:
			viewController?.navigationController?.popViewController(animated: true)
		case .signupScreen:
			viewController?.navigationController?.pushViewController(SignupModule.build(),
																	animated: true)
		case .app :
			AppStatusSwitcher.shared.updateRootVC()
			return
		}
	}
}
