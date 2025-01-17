//
//  CustomCell.swift
//  Daily
//
//  Created by Арсений Токарев on 06.11.2020.
//

import UIKit

protocol MainCellProtocol: UITableViewCell {
	func setViewModel(_ viewModel: MainCellViewModel?)
}

//MARK: - Basic model for all other cells
class DailyCell: UIElementContainerCell {
	internal let icon = UIImageView()
	internal let switcher = UISwitch()
	
	override func setViewModel(_ viewModel: MainCellViewModel?) {
		guard let viewModel = viewModel as? DailyCellViewModel else { return }
		if viewModel.isToggable {
			switcher.isHidden = false
			selectionStyle = .none
		} else {
			switcher.isHidden = true
		}
		
		if let iconComponent = viewModel.icon {
			icon.backgroundColor = iconComponent.tileColor
			icon.tintColor = iconComponent.symbolColor
			icon.image = iconComponent.symbol
		}
		
		switch viewModel.cellPosition {
		case .first:
			roundTopCorners(cornerRadius: 10)
		case .last:
			roundBottomCorners(cornerRadius: 10)
		case .within:
			sharpCorners()
		case .theOnly:
			roundCorners(cornerRadius: 10)
		}
	}
}

// MARK: - Date and Time cells
class DailyDateAndTimeCell: DailyCell {
	
	internal let titleLabel = UILabel()
	internal let dateAndTimeLabel = UILabel()
	internal let textStack = UIStackView()
	
	var dateAndTime: Date?
	
	override func setViewModel(_ viewModel: MainCellViewModel?) {
		super.setViewModel(viewModel)
		self.dateAndTime = (viewModel as? DailyDateAndTimeCellViewModel)?.dateAndTime
		self.titleLabel.text = (viewModel as? DailyDateAndTimeCellViewModel)?.title
	}
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		titleLabel.styleLabel(font: .systemFont(ofSize: 16),
							  text: nil,
							  textAlignment: .left,
							  textColor: .dailyOverlayButtonTextColor)
		
		dateAndTimeLabel.styleLabel(font: .systemFont(ofSize: 12, weight: .regular),
									text: nil,
									textAlignment: .left,
									textColor: .dailyAdaptiveBlue)
		
		
		textStack.styleStackView(spacing: 0, axis: .vertical)
		textStack.addArrangedSubview(titleLabel)
		textStack.addArrangedSubview(dateAndTimeLabel)
		configureDailyCell(titleView: textStack, icon: icon, switcher: switcher)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
}


// MARK: - Cell with DateAndTimePicker without text, icon and other elements other than DateAndTimePicker

class DailyTimeAndDatePickerCell: DailyCell {
	internal let picker = UIDatePicker()
	
	var dateAndTime: Date {
		return picker.date
	}
	
	override func setViewModel(_ viewModel: MainCellViewModel?) {
		super.setViewModel(viewModel)
		picker.date = (viewModel as? DailyDateAndTimeCellViewModel)?.dateAndTime ?? Date()
	
		
	}
	
	
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
