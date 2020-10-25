//
//  SignupVC.swift
//  Daily
//
//  Created by Арсений Токарев on 25.10.2020.
//

import UIKit
import FirebaseAuth
import Firebase

class SignupVC: UIViewController {

	let emailField = UITextField()
	let passwordField = UITextField()
	let signupButton = UIButton(type: .system)
	let errorLabel = UILabel()
	let stack = UIStackView()
	
	override func loadView() {
		super.loadView()
		
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

    }
    
	
	@objc func signupButtonTapped() {
		//Validate the fields
		let error = validateFields()
		
		if error != nil {
			showError(error!)
			
		} else {
			
			//Create the user
			
			Auth.auth().createUser(withEmail: <#T##String#>, password: <#T##String#>) { result, error in
				//check for errors
				if error != nil {
					//There was an error creating the user
					self.showError("Error creating user")
					
				} else {
					
					//User was created successfully
					
					
				}
			}
			
			//Transition to the home screen
			
		}
		
	}
	
	//Validate if data is correct. If everything is okay it reterns nil otherwise it reterns error message
	func validateFields() -> String? {
		//Check that all fields are filled in
		
		guard emailField.text?.trimmingCharacters(in: .whitespacesAndNewlines) != "" &&  passwordField.text?.trimmingCharacters(in: .whitespacesAndNewlines) != ""  else {
			return "Please fill in all fields"
		}
		
		
		
		return nil
	}
	
	func showError(_ message: String) {
		errorLabel.text = message
		errorLabel.alpha = 1
	}
	
	func setupElements() {
		
	}
	
	func styleElements() {

		Utilities.styleTextField(emailField, placeholder: "Email", isFirstLetterAutoCapitalized: true, isSecuredString: false)
		Utilities.styleTextField(passwordField, placeholder: "Password", isFirstLetterAutoCapitalized: false, isSecuredString: true)
		Utilities.styleAccountButton(signupButton, title: "Sign up", backgroundColor: .dailySignupButtonColor)
		Utilities.styleErrorLabel(errorLabel)
		Utilities.styleStackView(stack, spacing: 20, axis: .vertical, distribution: .fillEqually)
		
		errorLabel.alpha = 0
	}
	
	
}
