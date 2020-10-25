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
	let signupButton = UIButton(type: .system)
	let errorLabel = UILabel()
	let stack = UIStackView()
	
	override func loadView() {
		super.loadView()
		
		stack.addArrangedSubview(firstNameField)
		stack.addArrangedSubview(lastNameField)
		stack.addArrangedSubview(emailField)
		stack.addArrangedSubview(passwordField)
		stack.addArrangedSubview(signupButton)
		stack.addArrangedSubview(errorLabel)
	
		view.addSubview(stack)
		
		setupElements()
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()

		styleElements()
		signupButton.addTarget(self, action: #selector(signupButtonTapped), for: .touchUpInside)
    }
    
	
	@objc func signupButtonTapped() {
		//Validate the fields
		let error = validateFields()
		
		if error != nil {
			showError(error!)
			
		} else {
			
			//Created cleaned ver of the data
			let firstName = firstNameField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
			let lastName = lastNameField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
			let email = emailField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
			let password = passwordField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
			
			//Create the user
			
			Auth.auth().createUser(withEmail: email, password: password) { result, error in
				//check for errors
				if error != nil {
					//There was an error creating the user
					self.showError("Error creating user")
					
				} else {
					
					
					
					
					//User was created successfully

					let dataBase = Firestore.firestore()
					dataBase.collection("users").addDocument(data: ["firstname" : firstName, "lastname" : lastName, "uid" : result!.user.uid]) { error in

						if error != nil {
							//Show error message
							self.showError("Error saving user data")
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
		
		guard emailField.text?.trimmingCharacters(in: .whitespacesAndNewlines) != "" &&  passwordField.text?.trimmingCharacters(in: .whitespacesAndNewlines) != "" && firstNameField.text?.trimmingCharacters(in: .whitespacesAndNewlines) != "" && lastNameField.text?.trimmingCharacters(in: .whitespacesAndNewlines) != ""
		else {
			return "Please fill in all fields"
		}
		
		return nil
	}
	
	func showError(_ message: String) {
		errorLabel.text = message
		errorLabel.alpha = 1
	}
	
	func setupElements() {
		stack.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
		stack.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
		stack.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -20).isActive = true
	}
	
	func styleElements() {

		Utilities.styleTextField(firstNameField, placeholder: "First name", isFirstLetterAutoCapitalized: true, isSecuredString: false)
		Utilities.styleTextField(lastNameField, placeholder: "Last name", isFirstLetterAutoCapitalized: true, isSecuredString: false)
		Utilities.styleTextField(emailField, placeholder: "Email", isFirstLetterAutoCapitalized: true, isSecuredString: false)
		Utilities.styleTextField(passwordField, placeholder: "Password", isFirstLetterAutoCapitalized: false, isSecuredString: true)
		Utilities.styleAccountButton(signupButton, title: "Sign up", backgroundColor: .dailySignupButtonColor)
		Utilities.styleErrorLabel(errorLabel)
		Utilities.styleStackView(stack, spacing: 20, axis: .vertical, distribution: .fillEqually)
		
		errorLabel.alpha = 0
	}
	
	
	func transitionToHome() {
		let vc = TabBarVC()
		vc.modalPresentationStyle = .fullScreen
		present(vc, animated: true, completion: nil)
		//view.window?.rootViewController = TabBarVC()
		//view.window?.makeKeyAndVisible()
	}
	
}
