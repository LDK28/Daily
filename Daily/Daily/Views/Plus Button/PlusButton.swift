//
//  PlusButton.swift
//  Daily
//
//  Created by Арсений Токарев on 23.10.2020.
//
import UIKit



class PlusButton: UIButton {
	
	final override var frame: CGRect {
		didSet {
			decorateButton()
		}
	}
	
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
		decorateButton()
        
    }
	
	final private func decorateButton() {
		//make a plus image take 66% of a button view
		let lightConfiguration = UIImage.SymbolConfiguration(pointSize: frame.height / 1.5, weight: .light)
		

		guard let image = UIImage(systemName: "plus", withConfiguration: lightConfiguration)?.withTintColor(.white, renderingMode: .alwaysOriginal)
		else {
			fatalError("Couldn't find the image from systemName.")
		}
	
		self.setImage(image, for: .normal)
		self.backgroundColor = .dailyTabBarColor
		
		self.layer.cornerRadius = frame.height / 2
		self.layer.borderWidth = frame.height / 15
		self.layer.borderColor = UIColor.white.cgColor
	}
    
}
