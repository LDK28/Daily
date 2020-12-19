//
//  LoginInteractor.swift
//  Daily
//
//  Created by Арсений Токарев on 18.12.2020.
//  Copyright (c) 2020. All rights reserved.

import UIKit
import FirebaseAuth

class LoginInteractor: LoginDataStore {
	var presenter: LoginPresentationLogic?
	
	init(presenter: LoginPresentationLogic?) {
		self.presenter = presenter
	}
}

extension LoginInteractor: LoginBusinessLogic {
	func validateFields(email: String?,
						password: String?) {
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
		
		Auth.auth().signIn(withEmail: email, password: password) { result, error in
			guard error == nil else {
				self.presenter?.presentValidationMessage(message: error?.localizedDescription ?? "")
				return
			}
			self.presenter?.presentValidationMessage(message: nil)
		}
	}
}
