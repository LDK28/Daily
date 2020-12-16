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
        self.setTitle(NSLocalizedString(title, comment: "Account button title"), for: .normal)
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
        setTitle(NSLocalizedString(title, comment: "Button title"), for: .normal)
        tintColor = .dailyTextColor
        setTitleColor(.dailyTextColor, for: .normal)
        setTitleColor(.systemGray, for: .highlighted)
        titleLabel?.font = UIFont(name: "Stolzl-Book", size: 18)
        titleLabel?.adjustsFontSizeToFitWidth = true
        contentHorizontalAlignment = textAlignment
        if backgroundColor != .clear {
            layer.cornerRadius = 5
        }
    }
	
    func setTitleWithImage(text: String, with font: UIFont, in color: UIColor = .dailyTextColor, image: UIImage, for state: UIControl.State, imageFirst: Bool = false) {
        let buttonLabel = UILabel()
        buttonLabel.styleLabelWithImage(text: text, with: font, in: color, image: image, imageFirst: imageFirst)
        setAttributedTitle(buttonLabel.attributedText, for: state)
    }
	
	enum OverlayButtons: String {
		case save = "Add"
		case cancel = "Cancel"
	}
	
	func styleOverlayButton(buttonType: OverlayButtons) {
		self.translatesAutoresizingMaskIntoConstraints = false
        self.setTitle(NSLocalizedString(buttonType.rawValue, comment: "Overlay button title"), for: .normal)
		self.backgroundColor = buttonType == .save ? .dailyOverlayButtonTileColor : .clear
		self.setTitleColor(.dailyOverlayButtonTextColor, for: .normal)
		self.layer.cornerRadius = 5
		self.titleLabel?.font = UIFont.systemFont(ofSize: 20)
		contentHorizontalAlignment = .center
		contentEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
	}
	
}
