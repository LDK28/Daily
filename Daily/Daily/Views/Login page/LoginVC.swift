//
//  LoginVC.swift
//  Daily
//
//  Created by Арсений Токарев on 25.10.2020.
//

import UIKit
import FirebaseAuth

class LoginVC: MainVC {

	private let greetLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.text = "Welcome to Daily"
		label.textAlignment = .center
		label.font = UIFont(name: "Stolzl-Light", size: 30)
		return label
	}()
	
	private let emailField: UITextField = {
		let emailField = UITextField()
		emailField.translatesAutoresizingMaskIntoConstraints = false
		emailField.placeholder = "Email"
		emailField.overrideUserInterfaceStyle = .light
		emailField.borderStyle = .roundedRect
		return emailField
	}()
	
	private let passwordField: UITextField = {
		let passwordField = UITextField()
		passwordField.translatesAutoresizingMaskIntoConstraints = false
		passwordField.placeholder = "Password"
		passwordField.overrideUserInterfaceStyle = .light
		passwordField.borderStyle = .roundedRect
		passwordField.isSecureTextEntry = true
		return passwordField
	}()
	
	private let loginButton: UIButton = {
		let loginButton = UIButton(type: .system)
		loginButton.translatesAutoresizingMaskIntoConstraints = false
		loginButton.setTitle("Log in", for: .normal)
		loginButton.backgroundColor = .dailyLoginButtonColor
		loginButton.tintColor = .dailyTextColor
		loginButton.titleLabel?.font = UIFont(name: "Stolzl-Book", size: 18)
		loginButton.layer.cornerRadius = 5
		return loginButton
	}()
	
	private let signupButton: UIButton = {
		let signupButton = UIButton(type: .system)
		signupButton.translatesAutoresizingMaskIntoConstraints = false
		signupButton.setTitle("Sign up", for: .normal)
		signupButton.backgroundColor = .dailySignupButtonColor
		signupButton.tintColor = .dailyTextColor
		signupButton.titleLabel?.font = UIFont(name: "Stolzl-Book", size: 17)
		signupButton.layer.cornerRadius = 5
		return signupButton
	}()

	private let textFieldsAndLogButtonsStack: UIStackView = {
		let stack = UIStackView()
		stack.translatesAutoresizingMaskIntoConstraints = false
		stack.axis = .vertical
		stack.spacing = 20
		stack.distribution = .fillEqually
		return stack
	}()
	
	
	
	override func loadView() {
		super.loadView()
		
		textFieldsAndLogButtonsStack.addArrangedSubview(emailField)
		textFieldsAndLogButtonsStack.addArrangedSubview(passwordField)
		textFieldsAndLogButtonsStack.addArrangedSubview(loginButton)
		textFieldsAndLogButtonsStack.addArrangedSubview(signupButton)
		
		view.addSubview(textFieldsAndLogButtonsStack)
		view.addSubview(greetLabel)
		
		configureTextFieldsAndLogButtonsStack()
		configureGreetingLable()
		congigureButtons()
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()
		//view.lightLG()
		loginButton.addTarget(self, action: #selector(didTapLoginButton), for: .touchUpInside)
		signupButton.addTarget(self, action: #selector(didTapSignupButton), for: .touchUpInside)
    }
	
	@objc func didTapLoginButton() {
		guard let email = emailField.text, !email.isEmpty else {
			//More code to come
			return
		}
		
		guard let password = passwordField.text, !password.isEmpty else {
			//More code to come
			return
		}
		
	}
	
	@objc func didTapSignupButton() {
		// more code to come
	}
	
	func congigureButtons() {
		loginButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
		signupButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
		
		
	}
	
	func configureTextFieldsAndLogButtonsStack() {
		textFieldsAndLogButtonsStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
		textFieldsAndLogButtonsStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
		textFieldsAndLogButtonsStack.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
		textFieldsAndLogButtonsStack.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -20).isActive = true
	}
	
	func configureGreetingLable() {
		greetLabel.bottomAnchor.constraint(equalTo: textFieldsAndLogButtonsStack.topAnchor, constant: -50).isActive = true
		greetLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
		greetLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
		greetLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
	}
	

}
