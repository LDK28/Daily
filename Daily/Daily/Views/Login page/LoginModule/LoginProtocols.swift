//
//  LoginProtocols.swift
//  Daily
//
//  Created by Арсений Токарев on 18.12.2020.
//

import Foundation



//enum ValidationStatus {
//	case wrongEmail
//	case wrongPassword
//	case wrongUser
//	case logInError
//	case everythingIsFine
//}

enum LoginNavigationDestination {
	case signupScreen
	case app
}

protocol LoginDisplayLogic: AnyObject {
	func handleValidationResponse(message: String)
	func routeToApp()
}

protocol LoginBusinessLogic {
	func validateFields(email: String?,
						password: String?)
}

protocol LoginDataStore: AnyObject {
	
}

protocol LoginPresentationLogic {
	func presentValidationMessage(message: String?)
}

protocol LoginRoutingLogic {
	func navigateTo(_ destination: LoginNavigationDestination)
}

protocol LoginDataPassing {
	var dataStore: LoginDataStore? { get }
}
