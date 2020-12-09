//
//  ProfileSettingsRouter.swift
//  Daily
//
//  Created by Арсений Токарев on 08.12.2020.
//  Copyright (c) 2020. All rights reserved.

import UIKit

class SettingsRouter: ProfileRouter, SettingsDataPassing {
	weak var dataStore: SettingsDataStore?
  
	init(viewController: SettingsVC?, dataStore: SettingsDataStore?) {
		super.init(viewController: viewController)
		self.dataStore = dataStore
	}
}

extension SettingsRouter: SettingsRoutingLogic {
	
}
