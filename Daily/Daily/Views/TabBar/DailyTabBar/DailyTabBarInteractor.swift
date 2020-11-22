//
//  DailyTabBarInteractor.swift
//  Daily
//
//  Created by Арсений Токарев on 22.11.2020.
//  Copyright (c) 2020. All rights reserved.

import UIKit

class DailyTabBarInteractor: DailyTabBarDataStore {
	internal var userData: CurrentUser?
	private var presenter: DailyTabBarPresentationLogic?
	
	init(presenter: DailyTabBarPresentationLogic?, userData: CurrentUser?) {
		self.userData = userData
		self.presenter = presenter
	}
}

extension DailyTabBarInteractor: DailyTabBarBusinessLogic {
	
	func checkUserLoginStatus() {
		UserRequest.shared.loadUserData() { isSuccessful in
			if !isSuccessful {
				self.presenter?.prepareViewForRoutingToLoginScreen()
			}
		}
	}
}
