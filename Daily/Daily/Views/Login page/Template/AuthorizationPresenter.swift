//
//  AuthorizationPresenter.swift
//  Daily
//
//  Created by Арсений Токарев on 19.12.2020.
//  Copyright (c) 2020. All rights reserved.

import UIKit

class AuthorizationPresenter {
	weak var viewController: AuthorizationDisplayLogic?
	
	init(viewController: AuthorizationDisplayLogic?) {
		self.viewController = viewController
	}
}

extension AuthorizationPresenter: AuthorizationPresentationLogic {
	func presentCells(_ cellViewModels: [MainCellViewModel]) {
		viewController?.cellsToDisplay = cellViewModels
		viewController?.displayCells()
	}
	
	@objc func presentValidationMessage(message: String?) {
		if let message = message {
			viewController?.handleValidationResponse(message: message)
			return
		}
		viewController?.routeToApp()
	}
}
