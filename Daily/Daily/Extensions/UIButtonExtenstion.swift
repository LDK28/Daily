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
        translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = backgroundColor
        if titleLabel?.text == "" {
            setTitle(title, for: .normal)
            tintColor = .dailyTextColor
            setTitleColor(.dailyTextColor, for: .normal)
            setTitleColor(.systemGray, for: .highlighted)
            titleLabel?.font = UIFont(name: "Stolzl-Book", size: 18)
            titleLabel?.adjustsFontSizeToFitWidth = true
        }
        contentHorizontalAlignment = textAlignment
        if backgroundColor != .clear {
            layer.cornerRadius = 5
        }
    }
    func setTitleWithImage(text: String, with font: UIFont, in color: UIColor = .dailyTextColor, image: UIImage, for state: UIControl.State) {
        
        let imageAttachment = NSTextAttachment()
        imageAttachment.image = image.withTintColor(color)
        let textAttribute = [NSAttributedString.Key.font : font, NSAttributedString.Key.foregroundColor : color]
        let buttonTitle = NSMutableAttributedString(string: text, attributes: textAttribute as [NSAttributedString.Key : Any])
        buttonTitle.append(NSAttributedString(attachment: imageAttachment))
        
        setAttributedTitle(buttonTitle, for: state)
    }
}
