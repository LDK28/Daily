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
	func presentCells() {
		viewController?.cellsToDisplay = [
			TextFieldCellViewModel(cellType: TextFieldCell.self,
								   placeholder: "Email",
								   isFirstLetterAutoCapitalized: true,
								   isSecuredString: false),
			
			TextFieldCellViewModel(cellType: TextFieldCell.self,
								   placeholder: "Password",
								   isFirstLetterAutoCapitalized: false,
								   isSecuredString: true),
			
			ButtonCellViewModel(cellType: LoginButtonCell.self,
								title: "Log in",
								backgroundColor: .dailyLoginButtonColor),
			
			ButtonCellViewModel(cellType: SignupButtonCell.self,
								title: "Sign up",
								backgroundColor: .dailySignupButtonColor),
			
			OtherLoginOptionsCellViewModel(cellType: OtherLoginOptionsCell.self,
										   text: NSLocalizedString("You can also", comment: "")),
			
			ButtonCellViewModel(cellType: SignupButtonCell.self,
								title: " Sign in with Apple",
								backgroundColor: .white,
								foregroundColor: .black),
			
			ButtonCellViewModel(cellType: ContinueWithoutLoginInCell.self,
								title: NSLocalizedString("Continue without creating account", comment: ""),
								backgroundColor: .clear,
								foregroundColor: .dailyPlaceholderColor)
			
		]
		viewController?.displayCells()
	}
	
	func presentValidationMessage(message: String?) {
		if let message = message {
			viewController?.handleValidationResponse(message: message)
			return
		}
		
		viewController?.routeToApp()
	}
}
