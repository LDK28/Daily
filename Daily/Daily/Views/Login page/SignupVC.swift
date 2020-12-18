//
//  SignupVC.swift
//  Daily
//
//  Created by Арсений Токарев on 25.10.2020.
//

import UIKit
import FirebaseAuth
import Firebase

class SignupVC: MainVC {

	private let firstNameField = UITextField()
	private let lastNameField = UITextField()
	private let emailField = UITextField()
	private let passwordField = UITextField()
	private let confirmPasswordField = UITextField()
	private let signupButton = UIButton(type: .system)
	private let loginButton = UIButton(type: .system)
	private let errorLabel = UILabel()
	private let fieldsStask = UIStackView()
	private let buttonsStack = UIStackView()
	private let mainStack = UIStackView()
	private let createAccountLabel = UILabel()
	
	override func loadView() {
		super.loadView()
		
		fieldsStask.addArrangedSubview(errorLabel)
		fieldsStask.addArrangedSubview(firstNameField)
		fieldsStask.addArrangedSubview(lastNameField)
		fieldsStask.addArrangedSubview(emailField)
		fieldsStask.addArrangedSubview(passwordField)
		fieldsStask.addArrangedSubview(confirmPasswordField)
		
		buttonsStack.addArrangedSubview(signupButton)
		buttonsStack.addArrangedSubview(loginButton)
		
		mainStack.addArrangedSubview(createAccountLabel)
		mainStack.addArrangedSubview(fieldsStask)
		mainStack.addArrangedSubview(buttonsStack)
	
		view.addSubview(mainStack)
		
		configureElements()
		
		styleElements()
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()

		signupButton.addTarget(self, action: #selector(signupButtonTapped), for: .touchUpInside)
		loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
    }

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		
		firstNameField.text = ""
		lastNameField.text = ""
		emailField.text = ""
		passwordField.text = ""
		confirmPasswordField.text = ""
	}
    
	
	@objc func signupButtonTapped() {
		//Validate the fields
		let validationError = validateFields()
		
		if validationError != nil {
			showError(validationError!)
		} else {
			//Created cleaned versions of the data
			let firstName = firstNameField.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
			let lastName = lastNameField.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
			let email = emailField.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
			let password = passwordField.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
			
			//Create the user
			Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, userCreationError in
				/*
				you have not retained self, so in theory it might become nil at any time during the execution of the closure. It probably won't, but "probably" is not good enough. And exclamation marks are always an invitation to crash.
				*/
				guard let self = self else { return }
				//check for errors
				if userCreationError != nil {
					//There was an error creating the user
					self.showError(userCreationError?.localizedDescription ?? "Error")
				} else {
					//User was created successfully
					let dataBase = Firestore.firestore()
					let userID = result?.user.uid ?? "userIDFailed_newID_Is=\(firstName)_\(lastName)_\(email)"
					dataBase.collection("users").document(userID).setData(
						[
							"id" : userID,
							"name": [
								"firstName": firstName,
								"lastName": lastName
							],
							"email": email,
							"password": password,
							"notes": [NoteBackendModel](),
                            "tasks": [DiaryBackendModel]()
						]
					) { savingUserError in
						if savingUserError != nil {
							//Show error message
							self.showError(savingUserError!.localizedDescription)
						}
					}
					//Transition to the home screen
					self.transitionToHome()
				}
			}
		}
	}
	
	//Validate if data is correct. If everything is okay it reterns nil otherwise it reterns error message
	func validateFields() -> String? {
		
		//Check that all fields are filled in
		guard emailField.text?.trimmingCharacters(in: .whitespacesAndNewlines) != "" &&  passwordField.text?.trimmingCharacters(in: .whitespacesAndNewlines) != "" && firstNameField.text?.trimmingCharacters(in: .whitespacesAndNewlines) != "" && lastNameField.text?.trimmingCharacters(in: .whitespacesAndNewlines) != "" && confirmPasswordField.text?.trimmingCharacters(in: .whitespacesAndNewlines) != ""
		else {
			return "Please fill in all fields"
		}
		
		guard passwordField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == confirmPasswordField.text?.trimmingCharacters(in: .whitespacesAndNewlines) else {
			return "Passwords do not match"
		}
		
		return nil
	}
	
	func showError(_ message: String) {
		errorLabel.text = message
		errorLabel.alpha = 1
	}
	
	@objc func loginButtonTapped() {
		//navigationController?.popViewController(animated: true)
		dismiss(animated: true, completion: nil)
	}
	
	func configureElements() {
		
		NSLayoutConstraint.activate([
			mainStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
			mainStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
			mainStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			mainStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: UIScreen.main.bounds.height / 15),
			signupButton.heightAnchor.constraint(equalToConstant: 45),
			emailField.heightAnchor.constraint(equalToConstant: 40),
			
		])
	}
	
	func styleElements() {
		//Text Fields
		firstNameField.styleTextField(placeholder: "First name", isFirstLetterAutoCapitalized: true, isSecuredString: false)
		lastNameField.styleTextField(placeholder: "Last name", isFirstLetterAutoCapitalized: true, isSecuredString: false)
		emailField.styleTextField(placeholder: "Email", isFirstLetterAutoCapitalized: true, isSecuredString: false)
		passwordField.styleTextField(placeholder: "Password", isFirstLetterAutoCapitalized: false, isSecuredString: true)
		confirmPasswordField.styleTextField(placeholder: "Confirm password", isFirstLetterAutoCapitalized: false, isSecuredString: true)
		
		//Buttons
		signupButton.styleAccountButton(title: "Sign up", backgroundColor: .dailySignupButtonColor)
		loginButton.styleAccountButton(title: "Already have an account? Log in", backgroundColor: .clear, foregroundColor: UIColor("979797"))
		
		//Labels
		if let createAccountLabelFont = UIFont(name: "Stolzl-Light", size: 32) {
			createAccountLabel.styleLabel(font: createAccountLabelFont, text: "Create account")
		}
		
		if let errorLabelFont = UIFont(name: "Stolzl-Light", size: 16) {
			errorLabel.styleLabel(font: errorLabelFont, text: "", textAlignment: .left, textColor: .dailyAdaptiveRed)
			errorLabel.alpha = 0
		}
		
		//Stack views
		fieldsStask.styleStackView(spacing: 20, axis: .vertical)
		buttonsStack.styleStackView(spacing: 10, axis: .vertical, distribution: .equalSpacing)
		mainStack.styleStackView(spacing: 30, axis: .vertical, distribution: .fillProportionally)
		
	}
	
	
	func transitionToHome() {
		AppStatusSwitcher.shared.updateRootVC()
	}
	
}
