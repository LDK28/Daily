//
//  MainPagePresenter.swift
//  Daily
//
//  Created by Арсений Токарев on 08.12.2020.
//  Copyright (c) 2020. All rights reserved.

import UIKit

class MainPagePresenter: ProfilePresenter, MainPageDataStore {

}

extension MainPagePresenter: MainPagePresentationLogic {
	func prepareUserInfo(_ userCard: (UIImage?, Name?)) {
		
		let name = (userCard.1?.firstName ?? "") + " " + (userCard.1?.lastName ?? "")
		let profileModel = ProfileModel(text: name, image: userCard.0)
		let viewModels = [
			DailyCellViewModel(title: NSLocalizedString("Notifications", comment: ""),
							   icon: Icon(systemName: "app.badge.fill",
										  tileColor: .dailyAdaptiveOrange),
							   cellType: DailySettingsNotificationsCell.self,
							   isToggable: false,
							   cellPosition: .within),
			
			DailyCellViewModel(title: NSLocalizedString("Achievements", comment: ""),
							   icon: Icon(systemName: "rosette",
										  tileColor: .dailyAdaptiveBlue2),
							   cellType: DailyProfileAchievementsCell.self,
							   isToggable: false,
							   cellPosition: .within),
			
			DailyCellViewModel(title: NSLocalizedString("Help", comment: ""),
							   icon: Icon(systemName: "info.circle.fill",
										  tileColor: .dailyAdaptiveDarkBlue),
							   cellType: DailyProfileHelpCell.self,
							   isToggable: false,
							   cellPosition: .within),
			
			DailyCellViewModel(title: NSLocalizedString("Log out", comment: ""),
							   icon: Icon(systemName: "xmark",
										  tileColor: .dailyAdaptiveRed),
							   cellType: DailyProfileLogoutCell.self,
							   isToggable: false,
							   cellPosition: .within),
		]
		present(viewModels: viewModels,
				headerModel: profileModel)
	}
}
