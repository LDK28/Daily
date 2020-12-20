//
//  AuthorizationProtocols.swift
//  Daily
//
//  Created by Арсений Токарев on 19.12.2020.
//

import UIKit

enum LoginNavigationDestination {
	case loginScreen
	case signupScreen
	case app
}

protocol AuthorizationDisplayLogic: MainDisplayLogic {
	func displayCells()
	func routeToApp()
	func handleValidationResponse(message: String)
}

protocol AuthorizationBusinessLogic {
	func fetchCells()
	func didChangeEmail(_ email: String?)
	func didChangePassword(_ password: String?)
}

protocol AuthorizationPresentationLogic {
	func presentCells(_ cellsViewModels: [MainCellViewModel])
	func presentValidationMessage(message: String?)
}

protocol AuthorizationRoutingLogic {
	func navigateTo(_ destination: LoginNavigationDestination)
}
