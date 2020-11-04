//
//  UIButton Extenstion.swift
//  Daily
//
//  Created by Арсений Токарев on 29.10.2020.
//

import UIKit

extension UIButton {
	func styleAccountButton(title: String, backgroundColor: UIColor, foregroundColor: UIColor = .dailyTextColor) {
		
		self.translatesAutoresizingMaskIntoConstraints = false
		self.setTitle(title, for: .normal)
		self.backgroundColor = backgroundColor
		self.tintColor = .dailyTextColor
		self.setTitleColor(.dailyTextColor, for: .normal)
		self.titleLabel?.font = UIFont(name: "Stolzl-Book", size: 18)
		self.titleLabel?.adjustsFontSizeToFitWidth = true
		self.layer.cornerRadius = 5
	}
	
	enum OverlayButtons: String {
		case save = "Add"
		case cancel = "Cancel"
	}
	
	func styleOverlayButton(buttonType: OverlayButtons) {
		self.translatesAutoresizingMaskIntoConstraints = false
		self.setTitle(buttonType.rawValue, for: .normal)
		self.backgroundColor = buttonType == .save ? .dailyOverlayButtonTileColor : .clear
		self.setTitleColor(.dailyOverlayButtonTextColor, for: .normal)
		self.layer.cornerRadius = 5
		self.titleLabel?.font = UIFont.systemFont(ofSize: 20)
		contentHorizontalAlignment = .center
		contentEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
	}
	
}
