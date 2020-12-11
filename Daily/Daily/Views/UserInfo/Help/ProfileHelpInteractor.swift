//
//  ProfileHelpInteractor.swift
//  Daily
//
//  Created by Арсений Токарев on 08.12.2020.
//  Copyright (c) 2020. All rights reserved.

import UIKit

class ProfileHelpInteractor: ProfileHelpDataStore {
	var presenter: ProfileHelpPresentationLogic?
	
	init(presenter: ProfileHelpPresentationLogic?) {
		self.presenter = presenter
	}
}

extension ProfileHelpInteractor: ProfileHelpBusinessLogic {
	func doSomething() {
		
	}
}
