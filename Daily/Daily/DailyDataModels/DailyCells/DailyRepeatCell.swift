//
//  DailyRepeatCell.swift
//  Daily
//
//  Created by Арсений Токарев on 12.11.2020.
//

import UIKit

final class DailyRepeatCell: DailyOrdinaryCell {
	static let cellIdentifier = "DailyRepeatCell"
	
	private let repeatScheduleLabel = UILabel()
	
	var repeatSchedule: RepeatSchedule = .never {
		didSet {
			repeatScheduleLabel.text = repeatSchedule.rawValue
		}
	}
	
	func configureRepeatScheduleLabel() {
		contentView.addSubview(repeatScheduleLabel)
		
		repeatScheduleLabel.translatesAutoresizingMaskIntoConstraints = false
		repeatScheduleLabel.font = .systemFont(ofSize: titleLabel.font.pointSize, weight: .medium)
		repeatScheduleLabel.textColor = UIColor.dailyAdaptiveGreen
		repeatScheduleLabel.text = repeatSchedule.rawValue
		repeatScheduleLabel.textAlignment = .right
		
		repeatScheduleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20).isActive = true
		repeatScheduleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
	}
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		configureRepeatScheduleLabel()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
