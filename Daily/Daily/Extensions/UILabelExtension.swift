//
//  UILabelExtension.swift
//  Daily
//
//  Created by Арсений Токарев on 29.10.2020.
//

import UIKit

extension UILabel {
	func styleLabel(font: UIFont, text: String, textAlignment: NSTextAlignment = .center, textColor: UIColor = .dailyTextColor) {
		
		self.translatesAutoresizingMaskIntoConstraints = false
		self.font = font
		self.text = text
		self.textAlignment = textAlignment
		self.textColor = textColor
	}
	
	//MARK: Overlay extensions
	func styleOverlayLabel(text: String) {
		self.translatesAutoresizingMaskIntoConstraints = false
		self.font = UIFont(name: "Stolzl-Book", size: 36)
		self.text = text
		self.textAlignment = .left
		self.numberOfLines = 2
		self.textColor = .dailyTextColor
	}
}
