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

class DailyLanguageCell: DailyProfileCell {
	static let cellIdentifier = "DailyLanguageCell"
	
	private let checkmarkImageView = UIImageView()
	
	override func setViewModel(_ viewModel: MainCellViewModel?) {
		super.setViewModel(viewModel)
		guard let viewModel = viewModel as? LanguageCellViewModel else { return }
		let image = viewModel.language.rawValue == Locale.current.languageCode ? UIImage(systemName: "checkmark")?.withTintColor(.dailyTitleTextColor).withRenderingMode(.alwaysOriginal) : nil
		
		checkmarkImageView.image = image
	}
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		checkmarkImageView.translatesAutoresizingMaskIntoConstraints = false
		checkmarkImageView.contentMode = .scaleAspectFill
		contentView.addSubview(checkmarkImageView)
		
		NSLayoutConstraint.activate([
			checkmarkImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,
														 constant: -15),
			checkmarkImageView.topAnchor.constraint(equalTo: icon.topAnchor),
			checkmarkImageView.bottomAnchor.constraint(equalTo: icon.bottomAnchor),
			checkmarkImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
		])
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
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
