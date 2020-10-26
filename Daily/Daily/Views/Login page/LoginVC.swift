//
//  LoginVC.swift
//  Daily
//
//  Created by Арсений Токарев on 25.10.2020.
//

import UIKit
import FirebaseAuth
import Firebase


final class LoginVC: MainVC {

	private let emailField = UITextField()
	private let passwordField = UITextField()
	private let loginButton = UIButton(type: .system)
	private let signupButton = UIButton(type: .system)
	private let textFieldsAndLogButtonsStack = UIStackView()
	private let greetingLabel = UILabel()
	private let errorLabel = UILabel()

	override func loadView() {
		super.loadView()
		styleElements()
		
		//textFieldsAndLogButtonsStack.addArrangedSubview(errorLabel)
		textFieldsAndLogButtonsStack.addArrangedSubview(emailField)
		textFieldsAndLogButtonsStack.addArrangedSubview(passwordField)
		textFieldsAndLogButtonsStack.addArrangedSubview(loginButton)
		textFieldsAndLogButtonsStack.addArrangedSubview(signupButton)
		
		view.addSubview(textFieldsAndLogButtonsStack)
		view.addSubview(errorLabel)
		view.addSubview(greetingLabel)
		
		
		configureTextFieldsAndLogButtonsStack()
		configureGreetingLabel()
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()
		self.navigationController?.setNavigationBarHidden(true, animated: true)
		loginButton.addTarget(self, action: #selector(didTapLoginButton), for: .touchUpInside)
		signupButton.addTarget(self, action: #selector(didTapSignupButton), for: .touchUpInside)
		
		loginButton.addTarget(self, action: #selector(didTapLoginButton), for: .touchUpInside)
		
		signupButton.addTarget(self, action: #selector(didTapSignupButton), for: .touchUpInside)
		
    }
	
	
	@objc func didTapLoginButton() {
		
		//TODO: Validate fields
		let validationError = validateFields()
		
		if validationError != nil {
			showError(validationError!)
		} else {
			//create cleaned versions of the text field
			let email = emailField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
			let password = passwordField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
			
			//Sign in the user
			Auth.auth().signIn(withEmail: email, password: password) { result, userLoginError in
				if userLoginError != nil {
					//Couldnt sign in
					///TODO:
					self.showError(userLoginError!.localizedDescription)
					
				} else {
					let vc = TabBarVC()
					vc.modalPresentationStyle = .fullScreen
					self.present(vc, animated: true, completion: nil)
				}
			}
		}
	}
	
	@objc func didTapSignupButton() {

		let vc = SignupVC()
		vc.modalPresentationStyle = .fullScreen
		self.navigationController?.pushViewController(vc, animated: true)
	}
	
	func validateFields() -> String? {
		guard emailField.text?.trimmingCharacters(in: .whitespacesAndNewlines) != "" && passwordField.text?.trimmingCharacters(in: .whitespacesAndNewlines) != ""
		else {
			return "Please fill in all fields"
		}
		return nil
	}
	
	func showError(_ message: String) {
		errorLabel.text = message
		errorLabel.alpha = 1
	}
	
	
	func configureTextFieldsAndLogButtonsStack() {
//		textFieldsAndLogButtonsStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15).isActive = true
//		textFieldsAndLogButtonsStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15).isActive = true
//		textFieldsAndLogButtonsStack.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//		textFieldsAndLogButtonsStack.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -30).isActive = true
//		loginButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
//		signupButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
//		emailField.heightAnchor.constraint(equalToConstant: 40).isActive = true
//		passwordField.heightAnchor.constraint(equalToConstant: 40).isActive = true
	}
	
	func configureGreetingLabel() {
//		errorLabel.bottomAnchor.constraint(equalTo: textFieldsAndLogButtonsStack.topAnchor, constant: -50).isActive = true
//		errorLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//		errorLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
//		errorLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 20).isActive = true
//		errorLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 30).isActive = true
//
//		greetingLabel.bottomAnchor.constraint(equalTo: errorLabel.topAnchor, constant: -50).isActive = true
//		greetingLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//		greetingLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
//		greetingLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 20).isActive = true
//		greetingLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 30).isActive = true
//
		
	}
	
	func styleElements() {
		//Text Fields
		Utilities.styleTextField(emailField, placeholder: "Email", isFirstLetterAutoCapitalized: true, isSecuredString: false)
		Utilities.styleTextField(passwordField, placeholder: "Password", isFirstLetterAutoCapitalized: false, isSecuredString: true)
		
		//Buttons
		Utilities.styleAccountButton(loginButton, title: "Log in", backgroundColor: .dailyLoginButtonColor)
		Utilities.styleAccountButton(signupButton, title: "Sign up", backgroundColor: .dailySignupButtonColor)
		
		//Labels
		Utilities.styleGreetingLabel(greetingLabel)
		Utilities.styleErrorLabel(errorLabel)
		errorLabel.alpha = 0
		
		//Stack Views
		Utilities.styleStackView(textFieldsAndLogButtonsStack, spacing: 20, axis: .vertical, distribution: .fill)
		
	}
}
