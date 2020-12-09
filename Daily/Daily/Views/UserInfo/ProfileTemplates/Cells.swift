//
//  DailyProfileLogoutCell.swift
//  Daily
//
//  Created by Арсений Токарев on 08.12.2020.
//

import UIKit

class DailyProfileSettingCell: DailyProfileNavigationCell  {
	static let cellIdentifier = "DailyProfileSettingCell"
}

class DailyProfileAchievementsCell: DailyProfileNavigationCell {
	static let cellIdentifier = "DailyProfileAchievementsCell"
}

class DailyProfileHelpCell: DailyProfileNavigationCell {
	static let cellIdentifier = "DailyProfileHelpCell"
}

class DailySettingsNotificationsCell: DailyProfileNavigationCell {
	static let cellIdentifier = "DailySettingsNotificationsCell"
}

class DailySettingsLanguageCell: DailyProfileNavigationCell {
	static let cellIdentifier = "DailySettingsLanguageCell"
}

class DailyNotificationsSoundCell: DailyProfileNavigationCell {
	static let cellIdentifier = "DailyNotificationsSoundCell"
}

class DailyNotificationsAlarmCell: DailyProfileCell {
	static let cellIdentifier = "DailyNotificationsAlarmCell"
}

class DailyNotificationsReportCell: DailyProfileCell {
	static let cellIdentifier = "DailyNotificationsReportCell"
}


class DailyProfileLogoutCell: DailyProfileCell {
	static let cellIdentifier = "DailyProfileLogoutCell"
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		titleLabel.textColor = .dailyAdaptiveRed
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
