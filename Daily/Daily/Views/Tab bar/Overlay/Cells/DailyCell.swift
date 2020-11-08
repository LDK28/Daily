//
//  CustomCell.swift
//  Daily
//
//  Created by Арсений Токарев on 06.11.2020.
//

import UIKit

class DailyCellViewModel {
	let textView = UIStackView()
	let icon: UIImageView
	
	init(component: DailyCellComponent, for type: NewTaskViewModelItemType) {
		textView.styleStackView(spacing: 5, axis: .vertical)
		icon = UIImageView(image: component.icon.symbol)
		icon.tintColor = component.icon.symbolColor
		icon.backgroundColor = component.icon.tileColor
		icon.layer.cornerRadius = 5
		
		for title in component.titles {
			let labelForTitle = UILabel()
			labelForTitle.textAlignment = .left
			labelForTitle.text = title
			labelForTitle.font = .systemFont(ofSize: 12, weight: .regular)
			labelForTitle.translatesAutoresizingMaskIntoConstraints = false
			textView.addArrangedSubview(labelForTitle)
		}
	}
}

class DailyOrdinaryCell: UITableViewCell {

	static let cellIdentifier = "DailyOrdinaryCell"
	
	var titleLabel = UILabel()
	var icon = UIImageView()
	
	var component: DailyCellComponent? {
		didSet {
			guard let component = component else { return }
			
			icon.backgroundColor = component.icon.tileColor
			icon.tintColor = component.icon.symbolColor
			icon.image = component.icon.symbol
			
			titleLabel.text = component.titles[component.titles.startIndex]
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
	
	var textView = UIStackView()
	var titleLabel = UILabel()
	var dateAndTimeLabel = UILabel()
	var icon = UIImageView()
	
	var component: DailyCellComponent? {
		didSet {
			guard let component = component else { return }
			
			icon.backgroundColor = component.icon.tileColor
			icon.tintColor = component.icon.symbolColor
			icon.image = component.icon.symbol
			
			if component.titles.count > 1 {
				titleLabel.text = component.titles[0]
				dateAndTimeLabel.text = component.titles[1]
			}

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
		
		icon.layer.cornerRadius = 5
		icon.contentMode = .center
		
		titleLabel.font = .systemFont(ofSize: 16)
		titleLabel.textColor = .dailyOverlayButtonTextColor
		dateAndTimeLabel.font = .systemFont(ofSize: 14)
		dateAndTimeLabel.textColor = .systemBlue
		
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
