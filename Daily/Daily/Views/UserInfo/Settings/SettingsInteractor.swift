//
//  ProfileSettingsInteractor.swift
//  Daily
//
//  Created by Арсений Токарев on 08.12.2020.
//  Copyright (c) 2020. All rights reserved.

import UIKit

class SettingsInteractor: SettingsDataStore {
	var presenter: SettingsPresentationLogic?
	
	init(presenter: SettingsPresentationLogic?) {
		self.presenter = presenter
	}
}

extension SettingsInteractor: SettingsBusinessLogic {
	func fetchCells() {
		let headerModel = ProfileModel(text: NSLocalizedString("Settings", comment: ""),
									   image: UIImage(systemName: "gearshape.fill")?.withTintColor(.dailyTitleTextColor))
		let viewModels = [
			DailyCellViewModel(title: NSLocalizedString("Notifications", comment: ""),
							   icon: Icon(symbolName: "app.badge.fill",
										  tileColor: .dailyAdaptiveOrange),
							   cellType: DailySettingsNotificationsCell.self,
							   isToggable: false,
							   cellPosition: .within),

			DailyCellViewModel(title: NSLocalizedString("Lanugage", comment: ""),
							   icon: Icon(symbolName: "globe",
										  tileColor: .dailyAdaptiveBlue3),
							   cellType: DailySettingsLanguageCell.self,
							   isToggable: false,
							   cellPosition: .within),
		]
		presenter?.present(viewModels: viewModels, headerModel: headerModel)
	}
}
