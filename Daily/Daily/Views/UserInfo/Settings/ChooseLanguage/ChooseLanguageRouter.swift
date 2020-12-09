//
//  ChooseLanguageRouter.swift
//  Daily
//
//  Created by Арсений Токарев on 09.12.2020.
//  Copyright (c) 2020. All rights reserved.

import UIKit

class ChooseLanguageRouter: ProfileRouter, ChooseLanguageDataPassing {
	weak var dataStore: ChooseLanguageDataStore?
  
	init(viewController: ChooseLanguageVC?, dataStore: ChooseLanguageDataStore?) {
		super.init(viewController: viewController)
		self.dataStore = dataStore
	}
}

extension ChooseLanguageRouter: ChooseLanguageRoutingLogic {
	
}
