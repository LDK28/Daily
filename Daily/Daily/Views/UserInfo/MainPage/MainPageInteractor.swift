//
//  MainPageInteractor.swift
//  Daily
//
//  Created by Арсений Токарев on 08.12.2020.
//  Copyright (c) 2020. All rights reserved.

import UIKit

class MainPageInteractor: MainPageDataStore {
	var presenter: MainPagePresentationLogic?
	
	init(presenter: MainPagePresentationLogic?) {
		self.presenter = presenter
	}
}

extension MainPageInteractor: MainPageBusinessLogic {
	func fetchCells() {
		presenter?.prepareCells()
	}
}
