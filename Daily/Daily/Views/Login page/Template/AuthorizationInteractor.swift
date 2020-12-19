//
//  AuthorizationInteractor.swift
//  Daily
//
//  Created by Арсений Токарев on 19.12.2020.
//

import UIKit

class AuthorizationInteractor {
	var presenter: AuthorizationPresentationLogic?
	
	internal var email: String? = nil
	internal var password: String? = nil
	
	init(presenter: AuthorizationPresentationLogic?) {
		self.presenter = presenter
	}
}

extension AuthorizationInteractor: AuthorizationBusinessLogic {
	@objc func fetchCells() {
	}
	
	func didChangeEmail(_ email: String?) {
		self.email = email
	}
	
	func didChangePassword(_ password: String?) {
		self.password = password
	}
}
