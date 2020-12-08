//
//  ProfileHelpRouter.swift
//  Daily
//
//  Created by Арсений Токарев on 08.12.2020.
//  Copyright (c) 2020. All rights reserved.

import UIKit

class ProfileHelpRouter: ProfileHelpDataPassing {
	
	weak var viewController: ProfileHelpVC?
	weak var dataStore: ProfileHelpDataStore?
  
	init(viewController: ProfileHelpVC?, dataStore: ProfileHelpDataStore?) {
		self.viewController = viewController
		self.dataStore = dataStore
	}
}

extension ProfileHelpRouter: ProfileHelpRoutingLogic {
	
}
