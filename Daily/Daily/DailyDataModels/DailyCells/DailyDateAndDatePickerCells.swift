//
//  DailyDateAndDatePickerCells.swift
//  Daily
//
//  Created by Арсений Токарев on 12.11.2020.
//

import UIKit

final class DailyRequiredDateCell: DailyDateAndTimeCell {
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

protocol DailyOptionalDateCellDelegate: class {
	func didToggleDateSwitcher()
}
final class DailyOptionalDateCell: DailyDateAndTimeCell {
	static let cellIdentifier = "DailyOptionalDateCell"
	
	var date: Date? {
		didSet {
			if let date = date {
				let formatter = DateFormatter()
				formatter.dateFormat = "E, MMM d, yyyy"
				dateAndTimeLabel.text = formatter.string(from: date)
			} else {
				dateAndTimeLabel.text = "Any date"
			}
		}
	}
	
	override var viewModel: DailyCellViewModel? {
		didSet {
			guard let component = viewModel else { return }
			super.viewModel = component
			
			titleLabel.text = component.title
			dateAndTimeLabel.text = "Any day"
			switcher.addTarget(self, action: #selector(toggleSwitcher), for: .valueChanged)
		}
	}
	
	@objc func toggleSwitcher(switcher: UISwitch) {
		(delegate as? DailyOptionalDateCellDelegate)?.didToggleDateSwitcher()
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
