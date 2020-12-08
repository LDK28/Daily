//
//  File.swift
//  Daily
//
//  Created by Арсений Токарев on 08.12.2020.
//

import UIKit

class DailyProfileNavigationCell: DailyProfileCell {
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		self.accessoryType = .disclosureIndicator
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
