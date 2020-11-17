//
//  DailyTeamProjectCell.swift
//  Daily
//
//  Created by Арсений Токарев on 12.11.2020.
//

import UIKit

protocol DailyTeamProjectCellDelegate {
	func didToggleTeamProjectState()
}

final class DailyTeamProjectCell: DailyOrdinaryCell {
	static let cellIdentifier = "DailyTeamProjectCell"
	
	@objc func toggleSwitcher(switcher: UISwitch) {
		(parentView as? DailyTeamProjectCellDelegate)?.didToggleTeamProjectState()
	}
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		switcher.addTarget(self, action: #selector(toggleSwitcher), for: .valueChanged)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
