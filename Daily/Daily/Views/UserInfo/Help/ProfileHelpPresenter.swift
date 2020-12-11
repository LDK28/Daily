//
//  ProfileHelpPresenter.swift
//  Daily
//
//  Created by Арсений Токарев on 08.12.2020.
//  Copyright (c) 2020. All rights reserved.

import UIKit

class ProfileHelpPresenter: ProfileHelpDataStore {
	weak var viewController: ProfileHelpDisplayLogic?
	
	init(viewController: ProfileHelpDisplayLogic?) {
		self.viewController = viewController
	}
}

extension ProfileHelpPresenter: ProfileHelpPresentationLogic {
	func presentSomething() {
		
	}
}
