//
//  File.swift
//  Daily
//
//  Created by Арсений Токарев on 12.11.2020.
//

import UIKit

protocol DailyRemindCellDelegate {
	func didToggleRemindState()
}

final class DailyRemindCell: DailyOrdinaryCell {
	static let cellIdentifier = "DailyRemindCell"
	
	@objc func toggleSwitcher(switcher: UISwitch) {
		(parentView as? DailyRemindCellDelegate)?.didToggleRemindState()
	}
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		switcher.addTarget(self, action: #selector(toggleSwitcher), for: .valueChanged)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
