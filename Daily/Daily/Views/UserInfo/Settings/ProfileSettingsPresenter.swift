//
//  ProfileSettingsPresenter.swift
//  Daily
//
//  Created by Арсений Токарев on 08.12.2020.
//  Copyright (c) 2020. All rights reserved.

import UIKit

class ProfileSettingsPresenter: ProfileSettingsDataStore {
	weak var viewController: ProfileSettingsDisplayLogic?
	
	init(viewController: ProfileSettingsDisplayLogic?) {
		self.viewController = viewController
	}
}

extension ProfileSettingsPresenter: ProfileSettingsPresentationLogic {
	func presentSomething() {
		
	}
}
