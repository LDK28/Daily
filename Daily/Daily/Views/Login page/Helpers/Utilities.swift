//
//  Utilitie.swift
//  Daily
//
//  Created by Арсений Токарев on 25.10.2020.
//

import UIKit
import Foundation

extension UITextField {
	func styleTextField(placeholder: String, isFirstLetterAutoCapitalized: Bool, isSecuredString: Bool)  {
		
		self.translatesAutoresizingMaskIntoConstraints = false
		self.placeholder = placeholder
		self.overrideUserInterfaceStyle = .light
		self.borderStyle = .roundedRect
		self.leftViewMode = .always
		self.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 0))
		
		if isFirstLetterAutoCapitalized {
			self.autocapitalizationType = .none
		}
		if isSecuredString {
			self.isSecureTextEntry = true
		}
	}
}

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
	
}

extension UILabel {
	func styleLabel(font: UIFont, text: String, textAlignment: NSTextAlignment = .center, textColor: UIColor = .dailyTextColor) {
		
		self.translatesAutoresizingMaskIntoConstraints = false
		self.font = font
		self.text = text
		self.textAlignment = textAlignment
		self.textColor = textColor
	}
}

extension UIStackView {
	func styleStackView(spacing: CGFloat, axis:  NSLayoutConstraint.Axis, distribution: UIStackView.Distribution = .fillEqually) {
		
		self.translatesAutoresizingMaskIntoConstraints = false
		self.axis = axis
		self.spacing = spacing
		self.distribution = distribution
	}
}
