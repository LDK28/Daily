//
//  UITableViewCellExtension.swift
//  Daily
//
//  Created by Арсений Токарев on 08.11.2020.
//

import UIKit

extension UITableViewCell {
	func configureDailyCell(titleView: UIView, icon: UIImageView, switcher: UISwitch) {
		titleView.translatesAutoresizingMaskIntoConstraints = false
		icon.translatesAutoresizingMaskIntoConstraints = false
		icon.layer.cornerRadius = 5
		icon.contentMode = .center
		layer.cornerRadius = 10
		contentView.addSubview(titleView)
		contentView.addSubview(icon)
		backgroundColor = .dailyOverlayButtonTileColor
		
		
		let selectedView = UIView()
		selectedView.backgroundColor = UIColor.dailyTabBarColor.withAlphaComponent(0.5)
		selectedView.layer.cornerRadius = 10
		selectedBackgroundView = selectedView
		
		switcher.translatesAutoresizingMaskIntoConstraints = false
		switcher.isHidden = true
		switcher.onTintColor = .dailyAdaptiveBlue
		contentView.addSubview(switcher)
		
		NSLayoutConstraint.activate([
			icon.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
			icon.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
			icon.widthAnchor.constraint(equalToConstant: 21),
			icon.heightAnchor.constraint(equalTo: icon.widthAnchor),
			titleView.leadingAnchor.constraint(equalTo: icon.trailingAnchor, constant: 15),
			titleView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
			switcher.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
			switcher.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
		])
	}
}
