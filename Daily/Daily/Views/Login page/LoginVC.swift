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
	weak var coordinator: DailyCoordinator?

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
	}
	
	
	@objc func didTapLoginButton() {
		
		let validationError = validateFields()
		
		if validationError != nil {
			showError(validationError!)
		} else {
			//create cleaned versions of the text field
			let email = emailField.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
			let password = passwordField.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
			
			//Sign in the user
			Auth.auth().signIn(withEmail: email, password: password) { result, userLoginError in
				
				if userLoginError != nil {
					//Couldnt sign in
					self.showError(userLoginError?.localizedDescription ?? "Error")
					
				} else {
					AppStatusSwitcher.shared.updateRootVC()
				}
			}
		}
	}
	
	@objc func didTapSignupButton() {
		//navigationController?.pushViewController(SignupVC(), animated: true)
		present(SignupVC(), animated: true, completion: nil)
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
		//Text Fields
		emailField.styleTextField(placeholder: "Email", isFirstLetterAutoCapitalized: true, isSecuredString: false)
		passwordField.styleTextField(placeholder: "Password", isFirstLetterAutoCapitalized: false, isSecuredString: true)
		
		//Buttons
		loginButton.styleAccountButton(title: "Log in", backgroundColor: .dailyLoginButtonColor)
		signupButton.styleAccountButton(title: "Sign up", backgroundColor: .dailySignupButtonColor)
		
		//Labels
		if let greetingLabelFont = UIFont(name: "Stolzl-Light", size: 32) {
			greetingLabel.styleLabel(font: greetingLabelFont, text: "Welcome to Daily")
		}
		
		if let errorLabelFont = UIFont(name: "Stolzl-book", size: 16) {
			errorLabel.styleLabel(font: errorLabelFont, text: "", textAlignment: .left, textColor: .dailyAdaptiveRed)
			errorLabel.alpha = 0
		}
		
		
		//Stack Views
		textFieldsStack.styleStackView(spacing: 10, axis: .vertical)
		buttonsStack.styleStackView(spacing: 20, axis: .vertical)
		mainStack.styleStackView(spacing: 30, axis: .vertical, distribution: .fillProportionally)
		
	}
}
