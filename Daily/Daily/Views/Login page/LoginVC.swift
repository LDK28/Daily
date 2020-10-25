//
//  LoginVC.swift
//  Daily
//
//  Created by Арсений Токарев on 25.10.2020.
//

import UIKit
import FirebaseAuth

final class LoginVC: MainVC {

	private let emailField = UITextField()
	private let passwordField = UITextField()
	private let loginButton = UIButton(type: .system)
	private let signupButton = UIButton()
	private let greetLabel = UILabel()
	private let textFieldsAndLogButtonsStack = UIStackView()
	
	
	
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
		
		if FirebaseAuth.Auth.auth().currentUser != nil {
		}
    }
	
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)

		
	}
	
	@objc func didTapLoginButton() {
		
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
