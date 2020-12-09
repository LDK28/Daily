//
//  File.swift
//  Daily
//
//  Created by Арсений Токарев on 08.12.2020.
//

import UIKit

class DailyProfileCell: DailyOrdinaryCell {
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		titleLabel.font = UIFont(name: "Stolzl-Book", size: 20)
		titleLabel.textColor = .dailyTextColor
		backgroundColor = .dailyProfileTileColor
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
