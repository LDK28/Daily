//
//  ProfileSettingsVC.swift
//  Daily
//
//  Created by Арсений Токарев on 08.12.2020.
//  Copyright (c) 2020. All rights reserved.
//

import UIKit

class ProfileSettingsVC: ProfileTableVC {
	var interactor: ProfileSettingsBusinessLogic?
	var router: (ProfileSettingsRoutingLogic & ProfileSettingsDataPassing)?
  
	override func viewDidLoad() {
		super.viewDidLoad()
		
	}
  
}
extension ProfileSettingsVC: ProfileSettingsDisplayLogic {
	func displaySomething() {
	  
	}
}
