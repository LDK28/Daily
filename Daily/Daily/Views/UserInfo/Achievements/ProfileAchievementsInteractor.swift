//
//  ProfileAchievementsInteractor.swift
//  Daily
//
//  Created by Арсений Токарев on 08.12.2020.
//  Copyright (c) 2020. All rights reserved.

import UIKit

class ProfileAchievementsInteractor: ProfileAchievementsDataStore {
	var presenter: ProfileAchievementsPresentationLogic?
	
	init(presenter: ProfileAchievementsPresentationLogic?) {
		self.presenter = presenter
	}
}

extension ProfileAchievementsInteractor: ProfileAchievementsBusinessLogic {
	func doSomething() {
		
	}
}
