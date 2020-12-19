//
//  LoginVC.swift
//  Daily
//
//  Created by Арсений Токарев on 18.12.2020.
//  Copyright (c) 2020. All rights reserved.
//

import UIKit

class LoginVC: MainVC {
	weak var coordinator: DailyCoordinator?
	var interactor: LoginBusinessLogic?
	var router: (LoginRoutingLogic & LoginDataPassing)?
	
	private let emailField = UITextField()
	private let passwordField = UITextField()
	private let loginButton = UIButton(type: .system)
	private let signupButton = UIButton(type: .system)
	private let greetingLabel = UILabel()
	private let errorLabel = UILabel()
	private let textFieldsStack = UIStackView()
	private let buttonsStack = UIStackView()
	private let mainStack = UIStackView()

	override func loadView() {
		super.loadView()
		
		textFieldsStack.addArrangedSubview(errorLabel)
		textFieldsStack.addArrangedSubview(emailField)
		textFieldsStack.addArrangedSubview(passwordField)
		
		buttonsStack.addArrangedSubview(loginButton)
		buttonsStack.addArrangedSubview(signupButton)
		
		mainStack.addArrangedSubview(greetingLabel)
		mainStack.addArrangedSubview(textFieldsStack)
		mainStack.addArrangedSubview(buttonsStack)
		
		view.addSubview(mainStack)
		
		configureElements()
		
		styleElements()
	}
  
	override func viewDidLoad() {
    super.viewDidLoad()
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
  
}

extension LoginVC: LoginDisplayLogic {
	func handleValidationResponse(message: String) {
		showError(message)
	}
	
	func routeToApp() {
		router?.navigateTo(.app)
	}
}

extension LoginVC {
	func configureElements() {
		NSLayoutConstraint.activate([
			mainStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
			mainStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
			mainStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			mainStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: UIScreen.main.bounds.height / 8),
			loginButton.heightAnchor.constraint(equalToConstant: 45),
		
			emailField.heightAnchor.constraint(equalToConstant: 40),
		])
	}
		
	func styleElements() {
		emailField.styleTextField(placeholder: "Email",
								  isFirstLetterAutoCapitalized: true,
								  isSecuredString: false)
		passwordField.styleTextField(placeholder: "Password",
									 isFirstLetterAutoCapitalized: false,
									 isSecuredString: true)
		
		loginButton.styleAccountButton(title: "Log in", backgroundColor: .dailyLoginButtonColor)
		signupButton.styleAccountButton(title: "Sign up", backgroundColor: .dailySignupButtonColor)
		greetingLabel.styleLabel(font: UIFont(name: "Stolzl-Light", size: 32),
								 text: "Welcome to Daily")
		errorLabel.styleLabel(font: UIFont(name: "Stolzl-book", size: 16),
							  text: "",
							  textAlignment: .left,
							  textColor: .dailyAdaptiveRed,
							  numberOfLines: 0)
		errorLabel.alpha = 0
		
		
		textFieldsStack.styleStackView(spacing: 10, axis: .vertical)
		buttonsStack.styleStackView(spacing: 20, axis: .vertical)
		mainStack.styleStackView(spacing: 30, axis: .vertical, distribution: .fillProportionally)
		
	}
}
