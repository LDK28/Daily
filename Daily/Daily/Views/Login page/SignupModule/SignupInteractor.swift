//
//  SignupInteractor.swift
//  Daily
//
//  Created by Арсений Токарев on 19.12.2020.
//  Copyright (c) 2020. All rights reserved.

import UIKit
import FirebaseAuth
import Firebase

class SignupInteractor: AuthorizationInteractor {
	private var passwordConfirmation: String?
	private var firstName: String?
	private var lastName: String?
}

extension SignupInteractor: SignupBusinessLogic {
	func didChangeFirstName(_ firstName: String?) {
		self.firstName = firstName
	}
	
	func didChangeLastName(_ lastName: String?) {
		self.lastName = lastName
	}
	
	func didChangePasswordConfirmation(_ passwordConfirmation: String?) {
		self.passwordConfirmation = passwordConfirmation
	}
	
	override func fetchCells() {
		let cellViewModels: [MainCellViewModel] = [
			TextFieldCellViewModel(cellType: FirstNameTextFieldCell.self,
								   placeholder: NSLocalizedString("First name", comment: ""),
								   isFirstLetterAutoCapitalized: true,
								   isSecuredString: false),
			
			TextFieldCellViewModel(cellType: LastNameTextFieldCell.self,
								   placeholder: NSLocalizedString("Last name", comment: ""),
								   isFirstLetterAutoCapitalized: true,
								   isSecuredString: false),
			
			TextFieldCellViewModel(cellType: EmailTextFieldCell.self,
								   placeholder: NSLocalizedString("Email", comment: ""),
								   isFirstLetterAutoCapitalized: true,
								   isSecuredString: false),
			
			TextFieldCellViewModel(cellType: PasswordTextFieldCell.self,
								   placeholder: NSLocalizedString("Password", comment: ""),
								   isFirstLetterAutoCapitalized: false,
								   isSecuredString: true),
			
			TextFieldCellViewModel(cellType: ConfirmPasswordTextFieldCell.self,
								   placeholder: NSLocalizedString("Confirm password", comment: ""),
								   isFirstLetterAutoCapitalized: false,
								   isSecuredString: true),
			
			ButtonCellViewModel(cellType: SignupButtonCell.self,
								title: NSLocalizedString("Sign up", comment: ""),
								backgroundColor: .dailySignupButtonColor),
			
			ButtonCellViewModel(cellType: AlreadyHaveAccountButtonCell.self,
								title: NSLocalizedString("Already have an account? Log in",
														 comment: ""),
								backgroundColor: .clear,
								foregroundColor: .dailyPlaceholderColor)
		]
		presenter?.presentCells(cellViewModels)
	}
	
	func validateFields() {
		guard
			let firstName = firstName,
			let lastName = lastName,
			firstName != "",
			lastName != ""
		else {
			presenter?.presentValidationMessage(message: NSLocalizedString("Please, enter your name",
																		   comment: ""))
			return
		}
		
		guard
			let email = email,
			email != ""
		else {
			presenter?.presentValidationMessage(message: NSLocalizedString("Please, enter your email",
																		   comment: ""))
			return
		}
		
		guard
			let password = password,
			password != ""
		else {
			presenter?.presentValidationMessage(message: NSLocalizedString("Please, enter password",
																		   comment: ""))
			return
		}
		
		guard
			let passwordConfirmation = passwordConfirmation,
			passwordConfirmation == password
		else {
			presenter?.presentValidationMessage(message: NSLocalizedString("Passwords do not match",
																		   comment: ""))
			return
		}
		
		Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, userCreationError in

			guard let self = self else { return }
			if userCreationError != nil {
				self.presenter?.presentValidationMessage(message: NSLocalizedString("Could not create a user",
																			   
																					comment: ""))
			} else {
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
						"projects": [ProjectBackendModel]()
					]
				) { savingUserError in
					if savingUserError != nil {
						self.presenter?.presentValidationMessage(message: NSLocalizedString("User could not be saved",
																							comment: ""))
					}
				}
			}
		}
	}
}
