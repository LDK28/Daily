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