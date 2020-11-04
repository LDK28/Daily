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
    func styleHighlightedButton() {
        
    }
}
