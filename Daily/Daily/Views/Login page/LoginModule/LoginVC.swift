//
//  LoginVC.swift
//  Daily
//
//  Created by Арсений Токарев on 18.12.2020.
//  Copyright (c) 2020. All rights reserved.
//

import UIKit

class LoginVC: AuthorizationVC {
	weak var coordinator: DailyCoordinator?
	
	private let greetingView = AuthorizationTitleView(text: NSLocalizedString("Welcome to Daily",
																			comment: ""))

	override func loadView() {
		super.loadView()
		tableView.setAndLayoutTableHeaderView(header: greetingView)
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		navigationController?.setNavigationBarHidden(true, animated: true)
		view.subviews
			.compactMap{ $0 as? UITextField }
			.forEach {
				$0.text = nil
			}
	}
	
	func didTapSignupButton() {
		router?.navigateTo(.signupScreen)
	}
}

extension LoginVC: LoginButtonDelegate {
	func loginButtonTapped() {
		tableView.endEditing(true)
		(interactor as? LoginBusinessLogic)?.validateFields()
	}
}

extension LoginVC: SignupFromLoginButtonDelegate {
	func signupFromLoginButtonTapped() {
		router?.navigateTo(.signupScreen)
	}
}

extension LoginVC {
	override func configureTableView() {
		super.configureTableView()
		tableView.register(LoginButtonCell.self,
						   forCellReuseIdentifier: LoginButtonCell.cellIdentifier)
		
		tableView.register(SignupFromLoginButtonCell.self,
						   forCellReuseIdentifier: SignupFromLoginButtonCell.cellIdentifier)
		
		tableView.register(OtherLoginOptionsCell.self,
						   forCellReuseIdentifier: OtherLoginOptionsCell.cellIdentifier)
		
		tableView.register(ContinueWithoutLoginInCell.self,
						   forCellReuseIdentifier: ContinueWithoutLoginInCell.cellIdentifier)
	}
}
