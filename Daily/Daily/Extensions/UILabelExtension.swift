//
//  UILabelExtension.swift
//  Daily
//
//  Created by Арсений Токарев on 29.10.2020.
//

import UIKit

extension UILabel {
	func styleLabel(font: UIFont, text: String, textAlignment: NSTextAlignment = .center, textColor: UIColor = .dailyTextColor) {
		
		self.translatesAutoresizingMaskIntoConstraints = false
		self.font = font
		self.text = text
		self.textAlignment = textAlignment
		self.textColor = textColor
	}
    
    func styleLabelWithMutableAttributedString(text: NSMutableAttributedString, textAlignment: NSTextAlignment = .center) {
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.attributedText = text
        self.textAlignment = textAlignment
    }
    
    func styleLabelWithTwoFonts(firstText: String, with firstFont: UIFont, in firstColor: UIColor, secondText: String, with secondFont: UIFont, in secondColor: UIColor, textAlignment: NSTextAlignment = .left) {
        
        let firstTextAttribute = [NSAttributedString.Key.font : firstFont, NSAttributedString.Key.foregroundColor : firstColor]
        let secondTextAttribute = [NSAttributedString.Key.font : secondFont, NSAttributedString.Key.foregroundColor : secondColor]
        
        let firstTextMutableAttributedString = NSMutableAttributedString(string: firstText, attributes: firstTextAttribute as [NSAttributedString.Key : Any])
        let secondTextMutableAttributedString = NSMutableAttributedString(string: secondText, attributes: secondTextAttribute as [NSAttributedString.Key : Any])
        
        let finalText = NSMutableAttributedString(string: "")
        
        finalText.append(firstTextMutableAttributedString)
        finalText.append(secondTextMutableAttributedString)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.attributedText = finalText
        self.textAlignment = textAlignment
    }
}
