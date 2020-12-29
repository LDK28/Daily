//
//  DailyTimeAndTimePickerCells.swift
//  Daily
//
//  Created by Арсений Токарев on 12.11.2020.
//

import UIKit

protocol DailyTimeCellDelegate: class {
	func didToggleTimeSwitcher()
}

final class DailyTimeCell: DailyDateAndTimeCell {
	static let cellIdentifier = "DailyTimeCell"
	
	override var dateAndTime: Date? {
		didSet {
			if let time = dateAndTime {
				let formatter = DateFormatter()
				formatter.dateFormat = "h:mm a"
				dateAndTimeLabel.text = formatter.string(from: time)
			} else {
				dateAndTimeLabel.text = NSLocalizedString("Any time", comment: "")
			}
		}
	}

	@objc func toggleSwitcher(switcher: UISwitch) {
		(delegate as? DailyTimeCellDelegate)?.didToggleTimeSwitcher()
	}
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		switcher.addTarget(self, action: #selector(toggleSwitcher), for: .valueChanged)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}


protocol DailyTimePickerCellDelegate: class {
	func didChangeTime(newTime: Date)
}

final class DailyTimePickerCell: DailyTimeAndDatePickerCell {
	static let cellIdentifier = "DailyTimePickerCell"
	
	@objc func datePickerChanged(picker: UIDatePicker) {
		(delegate as? DailyTimePickerCellDelegate)?.didChangeTime(newTime: dateAndTime)
	}
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		picker.datePickerMode = .time
		picker.heightAnchor.constraint(equalToConstant: 50).isActive = true
		picker.addTarget(self, action: #selector(datePickerChanged), for: .valueChanged)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
