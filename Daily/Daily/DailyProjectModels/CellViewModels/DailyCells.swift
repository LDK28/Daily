//
//  CustomCell.swift
//  Daily
//
//  Created by Арсений Токарев on 06.11.2020.
//

import UIKit

//Only for inheritance
class DailyCell: UITableViewCell {
	internal let icon = UIImageView()
	let switcher = UISwitch()
	
	var viewModel: DailyCellViewModel? {
		didSet {
			guard let component = viewModel, let componentIcon = component.icon else { return }
			icon.backgroundColor = componentIcon.tileColor
			icon.tintColor = componentIcon.symbolColor
			icon.image = componentIcon.symbol

			if component.isToggable {
				switcher.isHidden = false
				selectionStyle = .none
			} else {
				switcher.isHidden = true
			}
		}
	}
}

// MARK: - Ordinary cell with single line text
class DailyOrdinaryCell: DailyCell {
	private let titleLabel = UILabel()
	
	override var viewModel: DailyCellViewModel? {
		didSet {
			guard let component = viewModel else { return }
			super.viewModel = component
			titleLabel.text = component.title
			titleLabel.font = .systemFont(ofSize: 16)
			
		}
	}
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		configureDailyCell(titleView: titleLabel, icon: icon, switcher: switcher)
		titleLabel.textColor = .dailyOverlayButtonTextColor
		titleLabel.translatesAutoresizingMaskIntoConstraints = false
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
}

final class DailyRemindCell: DailyOrdinaryCell {
	static let cellIdentifier = "DailyRemindCell"
	
	func remindStateToggled() {
		//more to come
	}
}

final class DailyRepeatCell: DailyOrdinaryCell {
	static let cellIdentifier = "DailyRepeatCell"
	
	func repeatEvery(/* day/week/etc */) {
		//more to come
	}
}

final class DailyTeamProjectCell: DailyOrdinaryCell {
	static let cellIdentifier = "DailyTeamProjectCell"
	
	func toggleTeamProjectState() {
		//more to come
	}
}

// MARK: - Date and Time cells
class DailyDateAndTimeCell: DailyCell {
	
	internal let titleLabel = UILabel()
	internal let dateAndTimeLabel = UILabel()
	internal let textStack = UIStackView()
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		configureDailyCell(titleView: textStack, icon: icon, switcher: switcher)
		
		titleLabel.font = .systemFont(ofSize: 16)
		titleLabel.textColor = .dailyOverlayButtonTextColor
		dateAndTimeLabel.font = .systemFont(ofSize: 12, weight: .regular)
		dateAndTimeLabel.textColor = .dailyAdaptiveBlue
		
		textStack.styleStackView(spacing: 0, axis: .vertical)
		textStack.addArrangedSubview(titleLabel)
		textStack.addArrangedSubview(dateAndTimeLabel)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
}

final class DailyNewTaskDateCell: DailyDateAndTimeCell {
	static let cellIdentifier = "DailyNewTaskDateCell"
	
	override var viewModel: DailyCellViewModel? {
		didSet {
			guard let component = viewModel else { return }
			super.viewModel = component
			
			titleLabel.text = component.title
			let date = Date()
			let formatter = DateFormatter()
			formatter.dateFormat = "E, MMM d, yyyy"
			let result = formatter.string(from: date)
			dateAndTimeLabel.text = result
			
		}
	}
}

final class DailyNewProjectDateCell: DailyDateAndTimeCell {
	static let cellIdentifier = "DailyNewProjectDateCell"
	
	override var viewModel: DailyCellViewModel? {
		didSet {
			guard let component = viewModel else { return }
			super.viewModel = component
			
			titleLabel.text = component.title
			dateAndTimeLabel.text = "Any day"
			
		}
	}
}


final class DailyTimeCell: DailyDateAndTimeCell {
	static let cellIdentifier = "DailyTimeCell"
	
	override var viewModel: DailyCellViewModel? {
		didSet {
			guard let component = viewModel else { return }
			super.viewModel = component
			
			titleLabel.text = component.title
			dateAndTimeLabel.text = "Any time"
			
		}
	}
}


// MARK: - Cell with DateAndTimePicker without text, icon and other elements other than DateAndTimePicker

class DailyTimeAndDatePickerCell: DailyCell {
	let picker = UIDatePicker()
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		if #available(iOS 14, *) {
			picker.preferredDatePickerStyle = .inline
		}
		picker.translatesAutoresizingMaskIntoConstraints = false
		contentView.addSubview(picker)
		configureDailyCell(titleView: picker, icon: icon, switcher: switcher)
		
		
		NSLayoutConstraint.activate([
			picker.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 5),
			picker.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
			picker.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5)
		])
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
}

final class DailyTimePickerCell: DailyTimeAndDatePickerCell {
	static let cellIdentifier = "DailyTimePickerCell"
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		picker.datePickerMode = .time
		picker.heightAnchor.constraint(equalToConstant: 50).isActive = true
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
}

final class DailyDatePickerCell: DailyTimeAndDatePickerCell {
	static let cellIdentifier = "DailyDatePickerCell"
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		picker.datePickerMode = .date
		picker.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: -5).isActive = true
	}
	
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
}
