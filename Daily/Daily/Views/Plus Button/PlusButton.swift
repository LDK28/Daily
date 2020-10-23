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
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
    }
	
	func designButton() {
		let lightConfiguration = UIImage.SymbolConfiguration(pointSize: frame.height / 1.5, weight: .light)
		let image = UIImage(systemName: "plus", withConfiguration: lightConfiguration)?.withTintColor(.white, renderingMode: .alwaysOriginal)
	
		self.setImage(image, for: .normal)
		
		self.currentBackgroundImage?.withTintColor(.white, renderingMode: .alwaysOriginal)
		
		self.titleLabel?.textColor = .white
		self.backgroundColor = .dailyTabBarColor
		
		self.layer.cornerRadius = frame.height / 2
		self.layer.borderWidth = frame.height / 15
		self.layer.borderColor = UIColor.white.cgColor
	}
    
}
