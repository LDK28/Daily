//
//  LoginProtocols.swift
//  Daily
//
//  Created by Арсений Токарев on 18.12.2020.
//

import Foundation
protocol LoginDisplayLogic: AuthorizationDisplayLogic {
	
}

protocol LoginBusinessLogic: AuthorizationBusinessLogic {
	func validateFields()
	
	func loginAnonymously()
}

protocol LoginPresentationLogic: AuthorizationPresentationLogic {
}
