//
//  UITextViewExtension.swift
//  Daily
//
//  Created by Арсений Токарев on 04.11.2020.
//

import UIKit

extension UITextView {
	static let placeholderColor = UIColor.systemGray2

	func styleMultiLineTextView(placeholder: String,
								backgroundColor: UIColor,
								cornerRadius: CGFloat) {
		self.text = NSLocalizedString(placeholder, comment: "Text view placeholder")
		self.textColor = UITextView.placeholderColor
		self.backgroundColor = backgroundColor
		self.font = .preferredFont(forTextStyle: .callout)
		self.translatesAutoresizingMaskIntoConstraints = false
		self.layer.cornerRadius = cornerRadius
	}
}

