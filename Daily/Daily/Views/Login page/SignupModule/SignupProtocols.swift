//
//  SignupProtocols.swift
//  Daily
//
//  Created by Арсений Токарев on 19.12.2020.
//

import UIKit

protocol SignupDisplayLogic: AuthorizationDisplayLogic {
}

protocol SignupBusinessLogic: AuthorizationBusinessLogic {
	func validateFields()
	func didChangeFirstName(_ firstName: String?)
	func didChangeLastName(_ lastName: String?)
	func didChangePasswordConfirmation(_ passwordConfirmation: String?)
}

protocol SignupPresentationLogic: AuthorizationPresentationLogic {
}
