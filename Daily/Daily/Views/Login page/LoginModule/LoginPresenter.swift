//
//  LoginPresenter.swift
//  Daily
//
//  Created by Арсений Токарев on 18.12.2020.
//  Copyright (c) 2020. All rights reserved.

import UIKit

class LoginPresenter: LoginDataStore {
	weak var viewController: LoginDisplayLogic?
	
	init(viewController: LoginDisplayLogic?) {
		self.viewController = viewController
	}
}

extension LoginPresenter: LoginPresentationLogic {
	func presentValidationMessage(message: String?) {
		if let message = message {
			viewController?.handleValidationResponse(message: message)
			return
		}
		
		viewController?.routeToApp()
	}
}
