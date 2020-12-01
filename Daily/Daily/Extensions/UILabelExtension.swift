//
//  UILabelExtension.swift
//  Daily
//
//  Created by Арсений Токарев on 29.10.2020.
//

import UIKit

extension UILabel {
    func styleLabel(font: UIFont, text: String, textAlignment: NSTextAlignment = .center, textColor: UIColor = .dailyTextColor, numberOfLines: Int = 1) {
		
		self.translatesAutoresizingMaskIntoConstraints = false
		self.font = font
		self.text = text
		self.textAlignment = textAlignment
        self.numberOfLines = numberOfLines
		self.textColor = textColor
	}
    
    func styleLabelWithMutableAttributedString(text: NSMutableAttributedString, textAlignment: NSTextAlignment = .center) {
        
        translatesAutoresizingMaskIntoConstraints = false
        attributedText = text
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
        
        translatesAutoresizingMaskIntoConstraints = false
        self.attributedText = finalText
        self.textAlignment = textAlignment
    }
    
    func styleLabelWithBackground(font: UIFont, text: String, textAlignment: NSTextAlignment = .center, textColor: UIColor = .dailyTextColor, numberOfLines: Int = 1, backgroundColor: UIColor = .clear, cornerRadius: CGFloat = 0) {
        styleLabel(font: font, text: text, textAlignment: textAlignment, textColor: textColor, numberOfLines: numberOfLines)
        self.backgroundColor = backgroundColor
        layer.masksToBounds = true
        layer.cornerRadius = cornerRadius
    }
    
    func styleLabelWithImage(text: String, with font: UIFont, in color: UIColor = .dailyTextColor, image: UIImage, imageFirst: Bool = false, textAlignment: NSTextAlignment = .center) {
        self.translatesAutoresizingMaskIntoConstraints = false
        let labelText = NSMutableAttributedString()
        let imageAttachment = NSTextAttachment()
        imageAttachment.image = image.withTintColor(color)
        let textAttribute = [NSAttributedString.Key.font : font, NSAttributedString.Key.foregroundColor : color]
        let textAttachment = NSMutableAttributedString(string: text, attributes: textAttribute as [NSAttributedString.Key : Any])
        if imageFirst {
            labelText.append(NSAttributedString(attachment: imageAttachment))
            labelText.append(textAttachment)
        } else {
            labelText.append(textAttachment)
            labelText.append(NSAttributedString(attachment: imageAttachment))
        }
        self.attributedText = labelText
        self.textAlignment = textAlignment
    }
	
	//MARK: Overlay extensions
	func styleOverlayLabel(text: String) {
		self.translatesAutoresizingMaskIntoConstraints = false
		self.font = UIFont(name: "Stolzl-Book", size: 36)
		self.text = text
		self.textAlignment = .left
		self.numberOfLines = 2
		self.textColor = .dailyTextColor
	}
}
