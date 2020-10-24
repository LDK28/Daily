//
//  PlusButton.swift
//  Daily
//
//  Created by Арсений Токарев on 23.10.2020.
//
import UIKit



class PlusButton: UIButton {
	private var imageName = "plus"
	private var buttonIsPressed = false
	
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
	
	func changeImage() {
		self.buttonIsPressed.toggle()
		let pointSize = buttonIsPressed ? frame.height / 1.8 : frame.height / 1.5 //  we use different size multipliers for different images
		
		let lightConfiguration = UIImage.SymbolConfiguration(pointSize: pointSize, weight: .light)
		
		let newImageName = buttonIsPressed ? "chevron.down" : "plus"
		
		guard let newImage = UIImage(systemName: newImageName, withConfiguration: lightConfiguration)?.withTintColor(.white, renderingMode: .alwaysOriginal)
		else {
			fatalError("Couldn't find the image from systemName.")
		}

		self.setImage(newImage, for: .normal)
		
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
