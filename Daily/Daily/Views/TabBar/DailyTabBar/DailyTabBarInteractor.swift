//
//  DailyTabBarInteractor.swift
//  Daily
//
//  Created by Арсений Токарев on 22.11.2020.
//  Copyright (c) 2020. All rights reserved.

import UIKit
import FirebaseAuth
import Firebase

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
		if let user = Auth.auth().currentUser {
			let db = Firestore.firestore()
			let userReference = db.collection("users").whereField("id", isEqualTo: user.uid)
			
			userReference.getDocuments() { (querySnapshot, error) in
				guard error == nil, let document = querySnapshot?.documents.first, let jsonData = try? JSONSerialization.data(withJSONObject: document.data()) else {
					self.presenter?.prepareViewForRoutingToLoginScreen()
					return
				}
				self.userData = try? JSONDecoder().decode(CurrentUser.self, from: jsonData)
				self.presenter?.present(using: self.userData)
			}
			return
		}
		presenter?.prepareViewForRoutingToLoginScreen()
	}
}
