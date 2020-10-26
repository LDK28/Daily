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

	let firstNameField = UITextField()
	let lastNameField = UITextField()
	let emailField = UITextField()
	let passwordField = UITextField()
	let confirmPasswordField = UITextField()
	let signupButton = UIButton(type: .system)
	let loginButton = UIButton(type: .system)
	let errorLabel = UILabel()
	let fieldsStask = UIStackView()
	let buttonsStack = UIStackView()
	let mainStack = UIStackView()
	
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
		
		mainStack.addArrangedSubview(fieldsStask)
		mainStack.addArrangedSubview(buttonsStack)
	
		view.addSubview(mainStack)
		
		setupElements()
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()

		styleElements()
		signupButton.addTarget(self, action: #selector(signupButtonTapped), for: .touchUpInside)
		loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
    }
    
	
	@objc func signupButtonTapped() {
		//Validate the fields
		let validationError = validateFields()
		
		if validationError != nil {
			showError(validationError!)
		} else {
			//Created cleaned versions of the data
			let firstName = firstNameField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
			let lastName = lastNameField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
			let email = emailField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
			let password = passwordField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
			
			//Create the user
			Auth.auth().createUser(withEmail: email, password: password) { result, userCreationError in
				//check for errors
				if userCreationError != nil {
					//There was an error creating the user
					self.showError(userCreationError!.localizedDescription)
				} else {
					//User was created successfully
					let dataBase = Firestore.firestore()
					dataBase.collection("users").addDocument(data: ["firstname" : firstName, "lastname" : lastName, "uid" : result!.user.uid]) { savingUserError in
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
		self.navigationController?.popViewController(animated: true)
	}
	
	func setupElements() {
		mainStack.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
		mainStack.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
		mainStack.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -20).isActive = true
		emailField.heightAnchor.constraint(equalToConstant: 40).isActive = true
		signupButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
		loginButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
	
	}
	
	func styleElements() {
		//Text Fields
		Utilities.styleTextField(firstNameField, placeholder: "First name", isFirstLetterAutoCapitalized: true, isSecuredString: false)
		Utilities.styleTextField(lastNameField, placeholder: "Last name", isFirstLetterAutoCapitalized: true, isSecuredString: false)
		Utilities.styleTextField(emailField, placeholder: "Email", isFirstLetterAutoCapitalized: true, isSecuredString: false)
		Utilities.styleTextField(passwordField, placeholder: "Password", isFirstLetterAutoCapitalized: false, isSecuredString: true)
		Utilities.styleTextField(confirmPasswordField, placeholder: "Confirm password", isFirstLetterAutoCapitalized: false, isSecuredString: true)
		
		//Buttons
		Utilities.styleAccountButton(signupButton, title: "Sign up", backgroundColor: .dailySignupButtonColor)
		Utilities.styleAccountButton(loginButton, title: "Already have an account? Log in", backgroundColor: .clear, foregroundColor: UIColor("979797"))
		
		//Labels
		Utilities.styleErrorLabel(errorLabel)
		errorLabel.alpha = 0
		
		//Stack views
		Utilities.styleStackView(fieldsStask, spacing: 15, axis: .vertical)
		Utilities.styleStackView(buttonsStack, spacing: 30, axis: .vertical, distribution: .equalSpacing)
		Utilities.styleStackView(mainStack, spacing: 50, axis: .vertical)
		
	}
	
	
	func transitionToHome() {
		let vc = TabBarVC()
		vc.modalPresentationStyle = .fullScreen
		present(vc, animated: true, completion: nil)
		//view.window?.rootViewController = TabBarVC()
		//view.window?.makeKeyAndVisible()
	}
	
}
