//
//  UITableViewCellExtension.swift
//  Daily
//
//  Created by Арсений Токарев on 08.11.2020.
//

import UIKit

extension UITableViewCell {
	func configureDailyCell(titleView: UIView?, icon: UIImageView?, switcher: UISwitch?) {
		backgroundColor = .dailyOverlayButtonTileColor
		let selectedView = UIView()
		selectedView.backgroundColor = UIColor.dailyTabBarColor.withAlphaComponent(0.5)
		selectedBackgroundView = selectedView
		
		if let icon = icon {
			icon.translatesAutoresizingMaskIntoConstraints = false
			icon.layer.cornerRadius = 5
			icon.contentMode = .center
			contentView.addSubview(icon)
			
			icon.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15).isActive = true
			icon.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
			icon.widthAnchor.constraint(equalToConstant: 21).isActive = true
			icon.heightAnchor.constraint(equalTo: icon.widthAnchor).isActive = true
		}
		
		if let titleView = titleView {
			titleView.translatesAutoresizingMaskIntoConstraints = false
			contentView.addSubview(titleView)
			
			titleView.leadingAnchor.constraint(equalTo: icon?.trailingAnchor ?? contentView.leadingAnchor, constant: 15).isActive = true
			titleView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
	
		}
		
		if let switcher = switcher {
			switcher.translatesAutoresizingMaskIntoConstraints = false
			switcher.isHidden = true
			switcher.onTintColor = .dailyAdaptiveBlue
			contentView.addSubview(switcher)
			
			switcher.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15).isActive = true
			switcher.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
			switcher.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
			switcher.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
		}
	}
	
	func roundTopCorners(cornerRadius: CGFloat) {
		layer.cornerRadius = cornerRadius
		layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
		selectedBackgroundView?.layer.maskedCorners = layer.maskedCorners
	}
	
	func roundBottomCorners(cornerRadius: CGFloat) {
		layer.cornerRadius = cornerRadius
		layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
		selectedBackgroundView?.layer.maskedCorners = layer.maskedCorners
	}
	
	func roundCorners(cornerRadius: CGFloat) {
		layer.cornerRadius = cornerRadius
		selectedBackgroundView?.layer.maskedCorners = layer.maskedCorners
	}
}
