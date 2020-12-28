//
//  LoginInteractor.swift
//  Daily
//
//  Created by Арсений Токарев on 18.12.2020.
//  Copyright (c) 2020. All rights reserved.

import UIKit
import FirebaseAuth

class LoginInteractor: AuthorizationInteractor {

}

extension LoginInteractor: LoginBusinessLogic {
	
	override func fetchCells() {
		let cellViewModels: [MainCellViewModel] = [
			LabelCellViewModel(cellType: ErrorLabelCell.self, text: nil),
			
			TextFieldCellViewModel(cellType: EmailTextFieldCell.self,
								   placeholder: "Email",
								   isFirstLetterAutoCapitalized: true,
								   isSecuredString: false),
			
			TextFieldCellViewModel(cellType: PasswordTextFieldCell.self,
								   placeholder: "Password",
								   isFirstLetterAutoCapitalized: false,
								   isSecuredString: true),
			
			ButtonCellViewModel(cellType: LoginButtonCell.self,
								title: "Log in",
								backgroundColor: .dailyLoginButtonColor),
			
			ButtonCellViewModel(cellType: SignupFromLoginButtonCell.self,
								title: "Sign up",
								backgroundColor: .dailySignupButtonColor),
			
			OtherLoginOptionsCellViewModel(cellType: OtherLoginOptionsCell.self,
										   text: NSLocalizedString("You can also", comment: "")),
			
			ButtonCellViewModel(cellType: SignupFromLoginButtonCell.self,
								title: " Sign in with Apple",
								backgroundColor: .white,
								foregroundColor: .black),
			
			ButtonCellViewModel(cellType: ContinueWithoutLoginInCell.self,
								title: NSLocalizedString("Continue without creating account", comment: ""),
								backgroundColor: .clear,
								foregroundColor: .dailyPlaceholderColor)
			
		]
		presenter?.presentCells(cellViewModels)
	}
	
	func validateFields() {
		guard
			let email = email?.trimmingCharacters(in: .whitespacesAndNewlines),
			email != ""
		else {
			presenter?.presentValidationMessage(message: NSLocalizedString("Email field is empty",
																		   comment: ""))
			return
		}
		
		guard
			let password = password?.trimmingCharacters(in: .whitespacesAndNewlines),
			password != ""
		else {
			presenter?.presentValidationMessage(message: NSLocalizedString("Password field is empty",
																		   comment: ""))
			return
		}
		
		Auth.auth().signIn(withEmail: email, password: password) { [weak self] result, error in
			guard let self = self else { return }
			guard error == nil else {
				self.presenter?.presentValidationMessage(message: error?.localizedDescription ?? "")
				return
			}
			self.presenter?.presentValidationMessage(message: nil)
		}
	}
}