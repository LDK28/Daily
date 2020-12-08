//
//  ProfileSettingsInteractor.swift
//  Daily
//
//  Created by Арсений Токарев on 08.12.2020.
//  Copyright (c) 2020. All rights reserved.

import UIKit

class ProfileSettingsInteractor: ProfileSettingsDataStore {
	var presenter: ProfileSettingsPresentationLogic?
	
	init(presenter: ProfileSettingsPresentationLogic?) {
		self.presenter = presenter
	}
}

extension ProfileSettingsInteractor: ProfileSettingsBusinessLogic {
	func doSomething() {
		
	}
}
