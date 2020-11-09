//
//  PlusButton.swift
//  Daily
//
//  Created by Арсений Токарев on 23.10.2020.
//
import UIKit



class PlusButton: UIButton {
	
	var isPressedToShowOverlay = false
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		layer.borderColor = UIColor.white.cgColor
		layer.shadowColor = UIColor.dailyShadowColor
		layer.shadowOffset = CGSize(width: 0, height: 10)
		layer.shadowRadius = 4
		layer.shadowOpacity = 0.1
		backgroundColor = .dailyTabBarColor
		translatesAutoresizingMaskIntoConstraints = false
		
	}
	
	required init?(coder: NSCoder) {
		super.init(coder: coder)
		decorateButton()
		
	}
	
	override func layoutSubviews() {
		super.layoutSubviews()
		decorateButton()
	}
	
	private final func decorateButton() {
		layer.cornerRadius = frame.height / 2
		layer.borderWidth = frame.height / 15
		
		let pointSize = isPressedToShowOverlay ? frame.height / 1.8 : frame.height / 1.5
		let lightConfiguration = UIImage.SymbolConfiguration(pointSize: pointSize, weight: .light)
		let newImageName = isPressedToShowOverlay ? "chevron.down" : "plus"
		if let newImage = UIImage(systemName: newImageName, withConfiguration: lightConfiguration)?.withTintColor(.white, renderingMode: .alwaysOriginal) {
			self.setImage(newImage, for: .normal)
		}
	}
	
}
