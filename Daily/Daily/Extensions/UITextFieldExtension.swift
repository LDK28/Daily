//
//  UITextFieldExtension.swift
//  Daily
//
//  Created by Арсений Токарев on 29.10.2020.
//

import UIKit

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
