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
	
	var time: Date? {
		didSet {
			if let time = time {
				let formatter = DateFormatter()
				formatter.dateFormat = "h:mm a"
				dateAndTimeLabel.text = formatter.string(from: time)
			} else {
				dateAndTimeLabel.text = "Any time"
			}
		}
	}
	
	override var viewModel: DailyCellViewModel? {
		didSet {
			guard let component = viewModel else { return }
			super.viewModel = component
			
			titleLabel.text = component.title
			dateAndTimeLabel.text = "Any time"
			switcher.addTarget(self, action: #selector(toggleSwitcher), for: .valueChanged)
		}
	}
	
	@objc func toggleSwitcher(switcher: UISwitch) {
		(parentView as? DailyTimeCellDelegate)?.didToggleTimeSwitcher()
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
		(parentView as? DailyTimePickerCellDelegate)?.didChangeTime(newTime: picker.date)
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
