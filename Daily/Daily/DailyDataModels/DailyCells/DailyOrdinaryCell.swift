//
//  DailyOrdinaryCell.swift
//  Daily
//
//  Created by Арсений Токарев on 12.11.2020.
//

import UIKit

// MARK: - Ordinary cell with single line text
class DailyOrdinaryCell: DailyCell {
	internal let titleLabel = UILabel()
	
	override func setViewModel(_ viewModel: MainCellViewModel?) {
		super.setViewModel(viewModel)
		titleLabel.text = (viewModel as? DailyCellViewModel)?.title
	}
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		configureDailyCell(titleView: titleLabel, icon: icon, switcher: switcher)
		titleLabel.textColor = .dailyOverlayButtonTextColor
		titleLabel.translatesAutoresizingMaskIntoConstraints = false
		titleLabel.font = .systemFont(ofSize: 16)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}	
}
