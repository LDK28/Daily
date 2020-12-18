//
//  ProfileAchievementsRouter.swift
//  Daily
//
//  Created by Арсений Токарев on 08.12.2020.
//  Copyright (c) 2020. All rights reserved.

import UIKit

class ProfileAchievementsRouter: ProfileAchievementsDataPassing {
	
	weak var viewController: ProfileAchievementsVC?
	weak var dataStore: ProfileAchievementsDataStore?
  
	init(viewController: ProfileAchievementsVC?, dataStore: ProfileAchievementsDataStore?) {
		self.viewController = viewController
		self.dataStore = dataStore
	}
}

extension ProfileAchievementsRouter: ProfileAchievementsRoutingLogic {
	
}
