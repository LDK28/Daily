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

class DailyCell: UITableViewCell {

	static let cellIdentifier = "Daily Cell"
	
	var textView = UIView()
	var icon = UIImageView()
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		
		textView.translatesAutoresizingMaskIntoConstraints = false
		icon.translatesAutoresizingMaskIntoConstraints = false
		
		contentView.addSubview(textView)
		contentView.addSubview(icon)
		
		icon.layer.cornerRadius = 5
		
		
		NSLayoutConstraint.activate([
			icon.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
			icon.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
			textView.leadingAnchor.constraint(equalTo: icon.trailingAnchor, constant: 10),
			textView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
		])
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
}
