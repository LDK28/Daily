//
//  ProfileSettingsRouter.swift
//  Daily
//
//  Created by Арсений Токарев on 08.12.2020.
//  Copyright (c) 2020. All rights reserved.

import UIKit

class ProfileSettingsRouter: ProfileSettingsDataPassing {
	
	weak var viewController: ProfileSettingsVC?
	weak var dataStore: ProfileSettingsDataStore?
  
	init(viewController: ProfileSettingsVC?, dataStore: ProfileSettingsDataStore?) {
		self.viewController = viewController
		self.dataStore = dataStore
	}
}

extension ProfileSettingsRouter: ProfileSettingsRoutingLogic {
	
}
