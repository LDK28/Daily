//
//  ProfileAchievementsPresenter.swift
//  Daily
//
//  Created by Арсений Токарев on 08.12.2020.
//  Copyright (c) 2020. All rights reserved.

import UIKit

class ProfileAchievementsPresenter: ProfileAchievementsDataStore {
	weak var viewController: ProfileAchievementsDisplayLogic?
	
	init(viewController: ProfileAchievementsDisplayLogic?) {
		self.viewController = viewController
	}
}

extension ProfileAchievementsPresenter: ProfileAchievementsPresentationLogic {
	func presentSomething() {
		
	}
}
