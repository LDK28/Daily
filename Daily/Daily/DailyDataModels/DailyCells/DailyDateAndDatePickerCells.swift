//
//  DailyDateAndDatePickerCells.swift
//  Daily
//
//  Created by Арсений Токарев on 12.11.2020.
//

import UIKit

final class DailyRequiredDateCell: DailyDateAndTimeCell {
	static let cellIdentifier = "DailyRequiredDateCell"
	
	override var dateAndTime: Date? {
		didSet {
			let date = dateAndTime ?? Date()
			let formatter = DateFormatter()
			formatter.dateFormat = "E, MMM d, yyyy"
			dateAndTimeLabel.text = formatter.string(from: date)
		}
	}
}

protocol DailyOptionalDateCellDelegate: class {
	func didToggleDateSwitcher()
}
final class DailyOptionalDateCell: DailyDateAndTimeCell {
	static let cellIdentifier = "DailyOptionalDateCell"
	
	override var dateAndTime: Date? {
		didSet {
			if let date = dateAndTime {
				let formatter = DateFormatter()
				formatter.dateFormat = "E, MMM d, yyyy"
				dateAndTimeLabel.text = formatter.string(from: date)
			} else {
				dateAndTimeLabel.text = NSLocalizedString("Any day", comment: "")
			}
		}
	}
	
	@objc func toggleSwitcher(switcher: UISwitch) {
		(delegate as? DailyOptionalDateCellDelegate)?.didToggleDateSwitcher()
	}
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		switcher.addTarget(self, action: #selector(toggleSwitcher), for: .valueChanged)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

protocol DailyDatePickerCellDelegate: class {
	func didChangeDate(newDay: Date)
}

final class DailyDatePickerCell: DailyTimeAndDatePickerCell {
	static let cellIdentifier = "DailyDatePickerCell"
	
	@objc func datePickerChanged(picker: UIDatePicker) {
		(delegate as? DailyDatePickerCellDelegate)?.didChangeDate(newDay: picker.date)
	}

	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		picker.datePickerMode = .date
		picker.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: -5).isActive = true
		picker.addTarget(self, action: #selector(datePickerChanged), for: .valueChanged)
	}
	
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
}
