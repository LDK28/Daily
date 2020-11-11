//
//  UITextViewExtension.swift
//  Daily
//
//  Created by Арсений Токарев on 04.11.2020.
//

import UIKit

extension UITextView {
	func styleMultiLineTextView(placeholder: String) {
		self.text = placeholder
		self.textColor = .systemGray2 //aka placeholder color
		self.backgroundColor = .dailyTextFieldColor
		self.font = .preferredFont(forTextStyle: .callout)
		self.translatesAutoresizingMaskIntoConstraints = false
		self.layer.cornerRadius = 10
	}
}
