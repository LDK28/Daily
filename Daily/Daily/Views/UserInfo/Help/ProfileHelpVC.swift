//
//  ProfileHelpVC.swift
//  Daily
//
//  Created by Арсений Токарев on 08.12.2020.
//  Copyright (c) 2020. All rights reserved.
//

import UIKit

class ProfileHelpVC: ProfileTableVC {
	var interactor: ProfileHelpBusinessLogic?
	var router: (ProfileHelpRoutingLogic & ProfileHelpDataPassing)?
  
	override func viewDidLoad() {
    super.viewDidLoad()
		
	}
  
}
extension ProfileHelpVC: ProfileHelpDisplayLogic {
	func displaySomething() {
	  
	}
}
