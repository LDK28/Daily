//
//  DailyDateAndDatePickerCells.swift
//  Daily
//
//  Created by Арсений Токарев on 12.11.2020.
//

import UIKit

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
