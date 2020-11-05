//
//  UIButton Extenstion.swift
//  Daily
//
//  Created by Арсений Токарев on 29.10.2020.
//

import UIKit

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
    func styleButton(title: String = "", backgroundColor: UIColor = .clear, textAlignment: UIControl.ContentHorizontalAlignment = .left) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = backgroundColor
        if self.titleLabel?.text == "" {
            self.setTitle(title, for: .normal)
            self.tintColor = .dailyTextColor
            self.setTitleColor(.dailyTextColor, for: .normal)
            self.setTitleColor(.systemGray, for: .highlighted)
            self.titleLabel?.font = UIFont(name: "Stolzl-Book", size: 18)
            self.titleLabel?.adjustsFontSizeToFitWidth = true
        }
        self.contentHorizontalAlignment = textAlignment
        if backgroundColor != .clear {
            self.layer.cornerRadius = 5
        }
    }
    func setTitleWithImage(text: String, with font: UIFont, in color: UIColor = .dailyTextColor, image: UIImage, for state: UIControl.State) {
        
        let imageAttachment = NSTextAttachment()
        imageAttachment.image = image.withTintColor(color)
        let textAttribute = [NSAttributedString.Key.font : font, NSAttributedString.Key.foregroundColor : color]
        let buttonTitle = NSMutableAttributedString(string: text, attributes: textAttribute as [NSAttributedString.Key : Any])
        buttonTitle.append(NSAttributedString(attachment: imageAttachment))
        
        self.setAttributedTitle(buttonTitle, for: state)
    }
}
