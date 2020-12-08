//
//  PlusButton.swift
//  Daily
//
//  Created by Арсений Токарев on 23.10.2020.
//
import UIKit



class PlusButton: UIButton {
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		translatesAutoresizingMaskIntoConstraints = false
		layer.borderColor = UIColor.white.cgColor
		backgroundColor = .dailyTabBarColor
		
	}
	
	required init?(coder: NSCoder) {
		super.init(coder: coder)
		
		
	}
	
	override func layoutSubviews() {
		super.layoutSubviews()
		layer.cornerRadius = 10
		layer.borderWidth = 2.5
		let plusConfig = UIImage.SymbolConfiguration(pointSize: frame.height / 1.5,
													 weight: .light)
		
		let plusImage = UIImage(systemName: "plus",
								withConfiguration: plusConfig)?.withTintColor(.white, renderingMode: .alwaysOriginal)
		setImage(plusImage, for: .normal)
		
		let chevronConfig = UIImage.SymbolConfiguration(pointSize: frame.height / 1.8,
														weight: .light)
		
		let chevronImage = UIImage(systemName: "chevron.down",
								   withConfiguration: chevronConfig)?.withTintColor(.white, renderingMode: .alwaysOriginal)
		
		setImage(chevronImage, for: [.selected])
		
	}
	
}
