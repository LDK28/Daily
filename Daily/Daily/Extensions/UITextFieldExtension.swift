//
//  UITextFieldExtension.swift
//  Daily
//
//  Created by Арсений Токарев on 29.10.2020.
//

import UIKit

extension UITextField {
	func styleTextField(placeholder: String, isFirstLetterAutoCapitalized: Bool, isSecuredString: Bool)  {
		
		self.standartStyling()
		self.placeholder = placeholder
		self.overrideUserInterfaceStyle = .light
		
		if isFirstLetterAutoCapitalized {
			self.autocapitalizationType = .none
		}
		
		if isSecuredString {
			self.isSecureTextEntry = true
		}
	}
	
	func styleOverlayTextField(placeholder: String) {
		self.standartStyling()
		self.placeholder = placeholder
		self.font = .preferredFont(forTextStyle: .headline)
	
	}
	
	private func standartStyling() {
		self.translatesAutoresizingMaskIntoConstraints = false
		self.layer.cornerRadius = 10
		self.leftViewMode = .always
		self.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
		self.backgroundColor = .dailyTextFieldColor
		self.tintColor = .dailyTextFieldTextColor
	}
}
