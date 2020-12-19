//
//  LoginVC.swift
//  Daily
//
//  Created by Арсений Токарев on 18.12.2020.
//  Copyright (c) 2020. All rights reserved.
//

import UIKit

class LoginVC: MainTableVC {
	weak var coordinator: DailyCoordinator?
	var interactor: LoginBusinessLogic?
	var router: (LoginRoutingLogic & LoginDataPassing)?
	
	private let emailField = UITextField()
	private let passwordField = UITextField()
	private let loginButton = UIButton(type: .system)
	private let signupButton = UIButton(type: .system)
	private let greetingView = GreetingView()
	private let errorLabel = UILabel()

	override func loadView() {
		super.loadView()
		configureTableView()
		tableView.setAndLayoutTableHeaderView(header: greetingView)
	}
  
	override func viewDidLoad() {
    super.viewDidLoad()
		interactor?.fetchCells()
		loginButton.addTarget(self, action: #selector(didTapLoginButton), for: .touchUpInside)
		signupButton.addTarget(self, action: #selector(didTapSignupButton), for: .touchUpInside)
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
	
	@objc func didTapLoginButton() {
		interactor?.validateFields(email: emailField.text,
								   password: passwordField.text)
	}
	
	@objc func didTapSignupButton() {
		router?.navigateTo(.signupScreen)
	}
	
	func showError(_ message: String) {
		errorLabel.text = message
		errorLabel.alpha = 1
	}
	
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		tableView.scrollToRow(at: indexPath, at: .middle, animated: true)
	}
  
}

extension LoginVC: LoginDisplayLogic {
	func displayCells() {
		tableView.reloadData()
	}
	
	func handleValidationResponse(message: String) {
		UIImpactFeedbackGenerator(style: .heavy).impactOccurred()
		showError(message)
	}
	
	func routeToApp() {
		router?.navigateTo(.app)
	}
}

extension LoginVC {
	func configureTableView() {
		tableView.delegate = self
		tableView.dataSource = self
		tableView.delaysContentTouches = false
		tableView.showsVerticalScrollIndicator = false
		tableView.separatorStyle = .none
		tableView.register(TextFieldCell.self,
						   forCellReuseIdentifier: TextFieldCell.cellIdentifier)
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
