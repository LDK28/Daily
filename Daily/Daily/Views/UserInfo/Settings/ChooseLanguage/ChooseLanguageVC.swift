//
//  ChooseLanguageVC.swift
//  Daily
//
//  Created by Арсений Токарев on 09.12.2020.
//  Copyright (c) 2020. All rights reserved.
//

import UIKit

class ChooseLanguageVC: ProfileTableVC {
	var interactor: ChooseLanguageBusinessLogic?
	var router: (ChooseLanguageRoutingLogic & ChooseLanguageDataPassing)?
  
	override func viewDidLoad() {
    super.viewDidLoad()
	
	}
  
}
extension ChooseLanguageVC: ChooseLanguageDisplayLogic {
	func displaySomething() {
	  
	}
}
