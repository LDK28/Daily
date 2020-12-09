//
//  ChooseLanguagePresenter.swift
//  Daily
//
//  Created by Арсений Токарев on 09.12.2020.
//  Copyright (c) 2020. All rights reserved.

import UIKit

class ChooseLanguagePresenter: ChooseLanguageDataStore {
	weak var viewController: ChooseLanguageDisplayLogic?
	
	init(viewController: ChooseLanguageDisplayLogic?) {
		self.viewController = viewController
	}
}

extension ChooseLanguagePresenter: ChooseLanguagePresentationLogic {
	func presentSomething() {
		
	}
}
