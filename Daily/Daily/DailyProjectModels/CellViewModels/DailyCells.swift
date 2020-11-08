//
//  CustomCell.swift
//  Daily
//
//  Created by Арсений Токарев on 06.11.2020.
//

import UIKit


class DailyOrdinaryCell: UITableViewCell {

	static let cellIdentifier = "DailyOrdinaryCell"
	
	private let titleLabel = UILabel()
	private let icon = UIImageView()
	
	var component: DailyCellComponent? {
		didSet {
			guard let component = component  else { return }
			
			icon.backgroundColor = component.icon.tileColor
			icon.tintColor = component.icon.symbolColor
			icon.image = component.icon.symbol
			
			titleLabel.text = component.title
			titleLabel.font = .systemFont(ofSize: 16)
		}
	}
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		
		titleLabel.translatesAutoresizingMaskIntoConstraints = false
		icon.translatesAutoresizingMaskIntoConstraints = false
		layer.cornerRadius = 10
		contentView.addSubview(titleLabel)
		contentView.addSubview(icon)
		backgroundColor = .dailyOverlayButtonTileColor
		
		let selectedView = UIView()
		selectedView.backgroundColor = UIColor.dailyTabBarColor.withAlphaComponent(0.5)
		selectedView.layer.cornerRadius = 10
		selectedBackgroundView = selectedView
		
		icon.layer.cornerRadius = 5
		icon.contentMode = .center
		
		titleLabel.textColor = .dailyOverlayButtonTextColor
		
		NSLayoutConstraint.activate([
			icon.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
			icon.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
			icon.widthAnchor.constraint(equalToConstant: 21),
			icon.heightAnchor.constraint(equalTo: icon.widthAnchor),
			titleLabel.leadingAnchor.constraint(equalTo: icon.trailingAnchor, constant: 15),
			titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
		])
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
}

class DailyDateAndTimeCell: UITableViewCell {
	static let cellIdentifier = "DailyDateAndTimeCell"
	
	private let textView = UIStackView()
	private let titleLabel = UILabel()
	private let dateAndTimeLabel = UILabel()
	private let icon = UIImageView()
	
	var component: DailyCellComponent? {
		didSet {
			guard let component = component else { return }
			
			icon.backgroundColor = component.icon.tileColor
			icon.tintColor = component.icon.symbolColor
			icon.image = component.icon.symbol
			
			titleLabel.text = component.title
			
			let date = Date()
			let formatter = DateFormatter()
			if component.cellType == .date {
				formatter.dateFormat = "E, MMM d, yyyy"
			} else {
				formatter.timeStyle = .short
			}
			let result = formatter.string(from: date)
			dateAndTimeLabel.text = result

		}
	}
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		
		textView.translatesAutoresizingMaskIntoConstraints = false
		icon.translatesAutoresizingMaskIntoConstraints = false
		layer.cornerRadius = 10
		contentView.addSubview(textView)
		contentView.addSubview(icon)
		backgroundColor = .dailyOverlayButtonTileColor
		
		let selectedView = UIView()
		selectedView.backgroundColor = UIColor.dailyTabBarColor.withAlphaComponent(0.5)
		selectedView.layer.cornerRadius = 10
		selectedBackgroundView = selectedView
		
		icon.layer.cornerRadius = 5
		icon.contentMode = .center
		
		titleLabel.font = .systemFont(ofSize: 16)
		titleLabel.textColor = .dailyOverlayButtonTextColor
		dateAndTimeLabel.font = .systemFont(ofSize: 12, weight: .regular)
		dateAndTimeLabel.textColor = .dailyAdaptiveBlue
		
		textView.styleStackView(spacing: 0, axis: .vertical)
		textView.addArrangedSubview(titleLabel)
		textView.addArrangedSubview(dateAndTimeLabel)
		
		NSLayoutConstraint.activate([
			icon.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
			icon.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
			icon.widthAnchor.constraint(equalToConstant: 21),
			icon.heightAnchor.constraint(equalTo: icon.widthAnchor),
			textView.leadingAnchor.constraint(equalTo: icon.trailingAnchor, constant: 15),
			textView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
		])
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
