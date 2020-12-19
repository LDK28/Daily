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
	
	private let greetingView = GreetingView()
	private let errorLabel = UILabel()

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
	
	func showError(_ message: String) {
		errorLabel.text = message
		errorLabel.alpha = 1
	}
}

extension LoginVC: LoginButtonDelegate {
	func loginButtonTapped() {
		(interactor as? LoginBusinessLogic)?.validateFields()
	}
}

extension LoginVC {
	override func configureTableView() {
		super.configureTableView()
		tableView.register(LoginButtonCell.self,
						   forCellReuseIdentifier: LoginButtonCell.cellIdentifier)
		tableView.register(SignupButtonCell.self,
						   forCellReuseIdentifier: SignupButtonCell.cellIdentifier)
		tableView.register(OtherLoginOptionsCell.self,
						   forCellReuseIdentifier: OtherLoginOptionsCell.cellIdentifier)
		tableView.register(ContinueWithoutLoginInCell.self,
						   forCellReuseIdentifier: ContinueWithoutLoginInCell.cellIdentifier)
	}
		
	func styleElements() {
		errorLabel.styleLabel(font: UIFont(name: "Stolzl-book", size: 16),
							  text: "",
							  textAlignment: .left,
							  textColor: .dailyAdaptiveRed,
							  numberOfLines: 0)
		errorLabel.alpha = 0
	}
}
