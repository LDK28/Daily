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
	
	var component: DailyCellComponent? {
		didSet {
			guard let component = component  else { return }
			icon.backgroundColor = component.icon.tileColor
			icon.tintColor = component.icon.symbolColor
			icon.image = component.icon.symbol

			if component.isToggable {
				switcher.isHidden = false
				selectionStyle = .none
			} else {
				switcher.isHidden = true
			}
		}
	}
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
}


// MARK: - Ordinary cell with single line text
final class DailyOrdinaryCell: DailyCell {

	static let cellIdentifier = "DailyOrdinaryCell"
	
	private let titleLabel = UILabel()
	
	override var component: DailyCellComponent? {
		didSet {
			guard let component = component else { return }
			super.component = component
			titleLabel.text = component.title
			titleLabel.font = .systemFont(ofSize: 16)
			
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

// MARK: - Date and Time cells
class DailyDateAndTimeCell: DailyCell {
	
	internal let titleLabel = UILabel()
	internal let dateAndTimeLabel = UILabel()
	internal let textView = UIStackView()
	
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

final class DailyNewTaskDateCell: DailyDateAndTimeCell {
	static let cellIdentifier = "DailyNewTaskDateCell"
	
	override var component: DailyCellComponent? {
		didSet {
			guard let component = component else { return }
			super.component = component
			
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
	
	override var component: DailyCellComponent? {
		didSet {
			guard let component = component else { return }
			super.component = component
			
			titleLabel.text = component.title
			dateAndTimeLabel.text = "Any day"
			
		}
	}
}


final class DailyTimeCell: DailyDateAndTimeCell {
	static let cellIdentifier = "DailyTimeCell"
	
	override var component: DailyCellComponent? {
		didSet {
			guard let component = component else { return }
			super.component = component
			
			icon.backgroundColor = component.icon.tileColor
			icon.tintColor = component.icon.symbolColor
			icon.image = component.icon.symbol
			
			titleLabel.text = component.title
			dateAndTimeLabel.text = "Any time"
			
		}
	}
}
