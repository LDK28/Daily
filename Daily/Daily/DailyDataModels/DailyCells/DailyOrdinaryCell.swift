//
//  DailyOrdinaryCell.swift
//  Daily
//
//  Created by Арсений Токарев on 12.11.2020.
//

import UIKit

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
