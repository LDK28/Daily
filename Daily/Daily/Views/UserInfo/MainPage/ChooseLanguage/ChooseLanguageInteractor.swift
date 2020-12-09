//
//  ChooseLanguageInteractor.swift
//  Daily
//
//  Created by Арсений Токарев on 09.12.2020.
//  Copyright (c) 2020. All rights reserved.

import UIKit

class ChooseLanguageInteractor: ChooseLanguageDataStore {
	var presenter: ChooseLanguagePresentationLogic?
	
	init(presenter: ChooseLanguagePresentationLogic?) {
		self.presenter = presenter
	}
}

extension ChooseLanguageInteractor: ChooseLanguageBusinessLogic {
	func doSomething() {
		
	}
}
