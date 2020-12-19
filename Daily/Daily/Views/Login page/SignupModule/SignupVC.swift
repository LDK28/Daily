//
//  SignupVC.swift
//  Daily
//
//  Created by Арсений Токарев on 19.12.2020.
//  Copyright (c) 2020. All rights reserved.
//

import UIKit

class SignupVC: AuthorizationVC {
	private let messageView = AuthorizationTitleView(text: NSLocalizedString("Create a new account",
																			comment: ""))	
	override func loadView() {
		super.loadView()
		tableView.setAndLayoutTableHeaderView(header: messageView)
	}
}

extension SignupVC: FirstNameTextFieldDelegate,
					LastNameTextFieldDelegate,
					ConfirmPasswordTextFieldDelegate {
	func changedFirstName(_ firstName: String?) {
		(interactor as? SignupBusinessLogic)?.didChangeFirstName(firstName)
	}
	
	func changedLastName(_ lastName: String?) {
		(interactor as? SignupBusinessLogic)?.didChangeLastName(lastName)
	}
	
	func changedPasswordConirmation(_ passwordConfirmation: String?) {
		(interactor as? SignupBusinessLogic)?.didChangePasswordConfirmation(passwordConfirmation)
	}
}

extension SignupVC: SignupButtonDelegate {
	func signupButtonTapped() {
		(interactor as? SignupBusinessLogic)?.validateFields()
	}
}

extension SignupVC: AlreadyHaveAccountButtonDelegate {
	func alreadyHaveAccountButtonTapped() {
		router?.navigateTo(.loginScreen)
	}
	
	
}

extension SignupVC {
	override func configureTableView() {
		super.configureTableView()
		tableView.register(FirstNameTextFieldCell.self,
						   forCellReuseIdentifier: FirstNameTextFieldCell.cellIdentifier)
		
		tableView.register(LastNameTextFieldCell.self,
						   forCellReuseIdentifier: LastNameTextFieldCell.cellIdentifier)
		
		tableView.register(ConfirmPasswordTextFieldCell.self,
						   forCellReuseIdentifier: ConfirmPasswordTextFieldCell.cellIdentifier)
		
		tableView.register(AlreadyHaveAccountButtonCell.self,
						   forCellReuseIdentifier: AlreadyHaveAccountButtonCell.cellIdentifier)
		
		tableView.register(SignupButtonCell.self,
						   forCellReuseIdentifier: SignupButtonCell.cellIdentifier)
	}
}
