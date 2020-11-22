//
//  DailyTabBarInteractor.swift
//  Daily
//
//  Created by Арсений Токарев on 22.11.2020.
//  Copyright (c) 2020. All rights reserved.

import UIKit
import FirebaseAuth

class DailyTabBarInteractor: DailyTabBarDataStore {
	var presenter: DailyTabBarPresentationLogic?
}

extension DailyTabBarInteractor: DailyTabBarBusinessLogic {
	func didTapPlusButton() {
		
	}
	
	func checkUserLoginStatus() {
		if let user = Auth.auth().currentUser {
			/* load data from data base */
			
			return
		}
		presenter?.prepareViewForRoutingToLoginScreen()
	}
}
