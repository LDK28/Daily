//
//  NotificationsInteractor.swift
//  Daily
//
//  Created by Арсений Токарев on 09.12.2020.
//  Copyright (c) 2020. All rights reserved.

import UIKit

class NotificationsInteractor: NotificationsDataStore {
	var presenter: NotificationsPresentationLogic?
	
	init(presenter: NotificationsPresentationLogic?) {
		self.presenter = presenter
	}
}

extension NotificationsInteractor: NotificationsBusinessLogic {
	func fetchCells() {
		let headerModel = ProfileModel(text: NSLocalizedString("Notifications",
															  comment: ""),
									  image: UIImage(systemName: "app.badge.fill")?.withTintColor(.dailyTitleTextColor))
		let viewModels = [
			DailyCellViewModel(title: NSLocalizedString("Sound",
														comment: ""),
							   icon: Icon(symbolName: "speaker.wave.2.fill",
										  tileColor: .dailyAdaptivePink),
							   cellType: DailyNotificationsSoundCell.self,
							   isToggable: false,
							   cellPosition: .within),
			
			DailyCellViewModel(title: NSLocalizedString("Notify beforehand",
														comment: ""),
							   icon: Icon(symbolName: "iphone.homebutton.radiowaves.left.and.right",
										  tileColor: .dailyAdaptiveRed),
							   cellType: DailyNotificationsAlarmCell.self,
							   isToggable: true,
							   cellPosition: .within),
			
			DailyCellViewModel(title: NSLocalizedString("Evening report",
														comment: ""),
							   icon: Icon(symbolName: "exclamationmark.bubble.fill",
										  tileColor: .dailyAdaptiveBlue),
							   cellType: DailyNotificationsReportCell.self,
							   isToggable: true,
							   cellPosition: .within),
		]
		presenter?.present(viewModels: viewModels, headerModel: headerModel)
	}
}
