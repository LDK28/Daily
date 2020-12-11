//
//  UITextFieldExtension.swift
//  Daily
//
//  Created by Арсений Токарев on 29.10.2020.
//

import UIKit

extension UITextField {
	
	func styleTextField(placeholder: String, isFirstLetterAutoCapitalized: Bool, isSecuredString: Bool)  {
		
		self.standartStyling(placeholder: placeholder)
		self.overrideUserInterfaceStyle = .light
		
		if isFirstLetterAutoCapitalized {
			self.autocapitalizationType = .none
		}
		
		if isSecuredString {
			self.isSecureTextEntry = true
		}
	}
	
	func styleOverlayTextField(placeholder: String) {
		self.standartStyling(placeholder: placeholder)
		self.font = .systemFont(ofSize: 28, weight: .semibold)
	
	}
	
	func styleEditingTextField(placeholder: String,
							   fontSize: CGFloat,
							   textColor: UIColor,
							   borderStyle: UITextField.BorderStyle) {
		self.borderStyle = borderStyle
		self.font = UIFont(name: "Stolzl-Regular", size: fontSize)
		self.textColor = textColor 
		self.placeholder = NSLocalizedString(placeholder, comment: "Title placeholder for note")
		self.translatesAutoresizingMaskIntoConstraints = false
	}
	
	private func standartStyling(placeholder: String) {
		self.translatesAutoresizingMaskIntoConstraints = false
		self.layer.cornerRadius = 10
		self.placeholder = NSLocalizedString(placeholder, comment: "placeholder for textField")
		self.leftViewMode = .always
		self.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
		self.backgroundColor = .dailyOverlayTextFieldColor
		self.tintColor = .dailyOverlayTextFieldTextColor
	}
}
