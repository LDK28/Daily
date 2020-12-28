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
    
    func styleClearTextView(font: UIFont,
                            text: String,
                            textColor: UIColor,
                            textAlignment: NSTextAlignment) {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .clear
        self.text = NSLocalizedString(text, comment: "Text view placeholder")
        self.textColor = textColor
        self.font = font
        self.textAlignment = textAlignment
    }
    
    var numberOfLines: Int {
        let numberOfGlyphs = self.layoutManager.numberOfGlyphs
        var index = 0, numberOfLines = 0
        var lineRange = NSRange(location: NSNotFound, length: 0)
        while index < numberOfGlyphs {
            self.layoutManager.lineFragmentRect(forGlyphAt: index, effectiveRange: &lineRange)
            index = NSMaxRange(lineRange)
            numberOfLines += 1
        }
        return numberOfLines
    }
}

