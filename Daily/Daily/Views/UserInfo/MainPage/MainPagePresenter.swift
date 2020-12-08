//
//  MainPagePresenter.swift
//  Daily
//
//  Created by Арсений Токарев on 08.12.2020.
//  Copyright (c) 2020. All rights reserved.

import UIKit

class MainPagePresenter: MainPageDataStore {
	weak var viewController: MainPageDisplayLogic?
	
	init(viewController: MainPageDisplayLogic?) {
		self.viewController = viewController
	}
}

extension MainPagePresenter: MainPagePresentationLogic {
	func prepareCells() {
		guard let viewController = viewController else { return }
		viewController.cellsToDisplay =
		[
			DailyCellViewModel(title: NSLocalizedString("Settings", comment: ""),
							   icon: Icon(symbolName: "gearshape.fill",
										  tileColor: .dailyAdaptiveGray),
							   cellType: DailyProfileSettingCell.self,
							   isToggable: false,
							   cellPosition: .within),
			
			DailyCellViewModel(title: NSLocalizedString("Achievements", comment: ""),
							   icon: Icon(symbolName: "rosette",
										  tileColor: .dailyAdaptiveBlue2),
							   cellType: DailyProfileAchievementsCell.self,
							   isToggable: false,
							   cellPosition: .within),
			
			DailyCellViewModel(title: NSLocalizedString("Help", comment: ""),
							   icon: Icon(symbolName: "info.circle.fill",
										  tileColor: .dailyAdaptiveDarkBlue),
							   cellType: DailyProfileHelpCell.self,
							   isToggable: false,
							   cellPosition: .within),
			
			DailyCellViewModel(title: NSLocalizedString("Log out", comment: ""),
							   icon: Icon(symbolName: "xmark",
										  tileColor: .dailyAdaptiveRed),
							   cellType: DailyProfileLogoutCell.self,
							   isToggable: false,
							   cellPosition: .within),
		]
	}
}
