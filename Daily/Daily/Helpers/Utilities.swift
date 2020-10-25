//
//  Utilitie.swift
//  Daily
//
//  Created by Арсений Токарев on 25.10.2020.
//

import UIKit

class Utilities {
	
	static func styleTextField(_ textField: UITextField, placeholder: String, isFirstLetterAutoCapitalized: Bool, isSecuredString: Bool)  {
		
		textField.translatesAutoresizingMaskIntoConstraints = false
		textField.placeholder = placeholder
		textField.overrideUserInterfaceStyle = .light
		textField.borderStyle = .roundedRect
		textField.leftViewMode = .always
		textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 0))
		
		if isFirstLetterAutoCapitalized {
			textField.autocapitalizationType = .none
		}
		if isSecuredString {
			textField.isSecureTextEntry = true
		}
	}
	
	static func styleAccountButton(_ button: UIButton, title: String, backgroundColor: UIColor) {
		
		button.translatesAutoresizingMaskIntoConstraints = false
		button.setTitle(title, for: .normal)
		button.backgroundColor = backgroundColor
		button.tintColor = .dailyTextColor
		button.titleLabel?.font = UIFont(name: "Stolzl-Book", size: 18)
		button.layer.cornerRadius = 5
	}
	
	static func styleLabel() {
		
	}
	
	static func styleStackView(_ stack: UIStackView, spacing: Int, axis:  NSLayoutConstraint.Axis, distribution: UIStackView.Distribution = .fillEqually) {
		stack.translatesAutoresizingMaskIntoConstraints = false
		stack.axis = axis
		stack.spacing = 20
		stack.distribution = distribution
	}
}
