//
//  ProfileAchievementsVC.swift
//  Daily
//
//  Created by Арсений Токарев on 08.12.2020.
//  Copyright (c) 2020. All rights reserved.
//

import UIKit

class ProfileAchievementsVC: ProfileTableVC {
	var interactor: ProfileAchievementsBusinessLogic?
	var router: (ProfileAchievementsRoutingLogic & ProfileAchievementsDataPassing)?
  
	override func viewDidLoad() {
		super.viewDidLoad()
	}
  
}
extension ProfileAchievementsVC: ProfileAchievementsDisplayLogic {
	func displaySomething() {
	  
	}
}
