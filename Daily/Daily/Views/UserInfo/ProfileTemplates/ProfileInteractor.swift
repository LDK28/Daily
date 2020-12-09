//
//  ProfileInteractor.swift
//  Daily
//
//  Created by Арсений Токарев on 09.12.2020.
//

import UIKit

protocol ProfileBusinessLogic {
	func fetchCells()
}

class ProfileInteractor: SettingsDataStore {
	var presenter: ProfilePresentationLogic?
	
	init(presenter: ProfilePresentationLogic?) {
		self.presenter = presenter
	}
}

extension ProfileInteractor: ProfileBusinessLogic {
	@objc func fetchCells() {
	}
}

