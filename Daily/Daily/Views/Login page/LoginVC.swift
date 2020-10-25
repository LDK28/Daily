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

	override func loadView() {
		super.loadView()
		styleElements()
		
		textFieldsAndLogButtonsStack.addArrangedSubview(emailField)
		textFieldsAndLogButtonsStack.addArrangedSubview(passwordField)
		textFieldsAndLogButtonsStack.addArrangedSubview(loginButton)
		textFieldsAndLogButtonsStack.addArrangedSubview(signupButton)
		
		view.addSubview(textFieldsAndLogButtonsStack)
		view.addSubview(greetingLabel)
		
		
		configureTextFieldsAndLogButtonsStack()
		configureGreetingLabel()
		congigureButtons()
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()
		loginButton.addTarget(self, action: #selector(didTapLoginButton), for: .touchUpInside)
		signupButton.addTarget(self, action: #selector(didTapSignupButton), for: .touchUpInside)
		
		loginButton.addTarget(self, action: #selector(didTapLoginButton), for: .touchUpInside)
		signupButton.addTarget(self, action: #selector(didTapSignupButton), for: .touchUpInside)
		
    }
	
	
	@objc func didTapLoginButton() {
		
		//TODO: Validate fields
		
		//create cleaned versions of the text field
		let email = emailField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
		let password = passwordField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
		
		//Sign in the user
		Auth.auth().signIn(withEmail: email, password: password) { result, error in
			if error != nil {
				//Couldnt sign in
				///TODO:
				//self.errorLabel.text = error!.localizedDescription
				//self.errorLabel.alpha = 1
				
			} else {
				let vc = TabBarVC()
				vc.modalPresentationStyle = .fullScreen
				self.present(vc, animated: true, completion: nil)
				//self.view.window?.rootViewController = TabBarVC()
				//self.view.window?.makeKeyAndVisible()
			}
		}
		
	}
	
	@objc func didTapSignupButton() {

		let vc = SignupVC()
		vc.modalPresentationStyle = .fullScreen
		
	//	present(vc, animated: true, completion: nil)
		self.navigationController?.pushViewController(vc, animated: true)
		//self.view.window?.rootViewController = SignupVC()
		//self.view.window?.makeKeyAndVisible()
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
	
	func configureGreetingLabel() {
		greetingLabel.bottomAnchor.constraint(equalTo: textFieldsAndLogButtonsStack.topAnchor, constant: -50).isActive = true
		greetingLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
		greetingLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
		greetingLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 20).isActive = true
		greetingLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 30).isActive = true
	}
	
	func styleElements() {
		Utilities.styleGreetingLabel(greetingLabel)
		Utilities.styleTextField(emailField, placeholder: "Email", isFirstLetterAutoCapitalized: true, isSecuredString: false)
		Utilities.styleTextField(passwordField, placeholder: "Password", isFirstLetterAutoCapitalized: false, isSecuredString: true)
		Utilities.styleAccountButton(loginButton, title: "Log in", backgroundColor: .dailyLoginButtonColor)
		Utilities.styleAccountButton(signupButton, title: "Sign up", backgroundColor: .dailySignupButtonColor)
		Utilities.styleStackView(textFieldsAndLogButtonsStack, spacing: 20, axis: .vertical)
	}
}
