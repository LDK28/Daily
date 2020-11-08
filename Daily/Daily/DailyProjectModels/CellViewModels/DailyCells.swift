//
//  CustomCell.swift
//  Daily
//
//  Created by Арсений Токарев on 06.11.2020.
//

import UIKit

// MARK: - Ordinary cell with single line text
class DailyOrdinaryCell: UITableViewCell {

	static let cellIdentifier = "DailyOrdinaryCell"
	
	private let titleLabel = UILabel()
	private let icon = UIImageView()
	let switcher = UISwitch()
	
	var component: DailyCellComponent? {
		didSet {
			guard let component = component  else { return }
			
			icon.backgroundColor = component.icon.tileColor
			icon.tintColor = component.icon.symbolColor
			icon.image = component.icon.symbol
			
			titleLabel.text = component.title
			titleLabel.font = .systemFont(ofSize: 16)
			switcher.isHidden = component.isToggable ? false : true
		
		}
	}
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		configureDailyCell(titleView: titleLabel, icon: icon, switcher: switcher)
		titleLabel.textColor = .dailyOverlayButtonTextColor
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
}

// MARK: - Date and Time cell
class DailyDateAndTimeCell: UITableViewCell {
	
	internal let textView = UIStackView()
	internal let titleLabel = UILabel()
	internal let dateAndTimeLabel = UILabel()
	internal let icon = UIImageView()
	let switcher = UISwitch()
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		
		configureDailyCell(titleView: textView, icon: icon, switcher: switcher)
		
		titleLabel.font = .systemFont(ofSize: 16)
		titleLabel.textColor = .dailyOverlayButtonTextColor
		dateAndTimeLabel.font = .systemFont(ofSize: 12, weight: .regular)
		dateAndTimeLabel.textColor = .dailyAdaptiveBlue
		
		textView.styleStackView(spacing: 0, axis: .vertical)
		textView.addArrangedSubview(titleLabel)
		textView.addArrangedSubview(dateAndTimeLabel)
		
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

final class DailyDateCell: DailyDateAndTimeCell {
	static let cellIdentifier = "DailyTimeCell"
	
	var component: DailyCellComponent? {
		didSet {
			guard let component = component else { return }
			
			icon.backgroundColor = component.icon.tileColor
			icon.tintColor = component.icon.symbolColor
			icon.image = component.icon.symbol
			
			titleLabel.text = component.title
			let date = Date()
			let formatter = DateFormatter()
			formatter.dateFormat = "E, MMM d, yyyy"
			let result = formatter.string(from: date)
			dateAndTimeLabel.text = result
			
			switcher.isHidden = component.isToggable ? false : true
		}
	}
}


final class DailyTimeCell: DailyDateAndTimeCell {
	static let cellIdentifier = "DailyDateCell"
	
	var component: DailyCellComponent? {
		didSet {
			guard let component = component else { return }
			
			icon.backgroundColor = component.icon.tileColor
			icon.tintColor = component.icon.symbolColor
			icon.image = component.icon.symbol
			
			titleLabel.text = component.title
			dateAndTimeLabel.text = "All day"
			
			switcher.isHidden = component.isToggable ? false : true
		}
	}
}
