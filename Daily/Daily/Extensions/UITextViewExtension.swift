//
//  UITextViewExtension.swift
//  Daily
//
//  Created by Арсений Токарев on 04.11.2020.
//

import UIKit

extension UITextView {
	static let placeholderColor = UIColor.dailyTextColor.withAlphaComponent(0.25)

	func styleMultiLineTextView(placeholder: String,
								fontSize: CGFloat,
								backgroundColor: UIColor,
								cornerRadius: CGFloat) {
		self.text = NSLocalizedString(placeholder, comment: "Text view placeholder")
		self.textColor = UITextView.placeholderColor
		self.backgroundColor = backgroundColor
		self.font = .systemFont(ofSize: fontSize, weight: .regular)
		self.translatesAutoresizingMaskIntoConstraints = false
		self.layer.cornerRadius = cornerRadius
	}
}

