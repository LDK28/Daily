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
	
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
		decorateButton()
        
    }
	
	override func layoutSubviews() {
		super.layoutSubviews()
		decorateButton()
	}
	
	final func toggleImage() {
		buttonIsPressed.toggle()
		// We use different size multipliers for different images
		let pointSize = buttonIsPressed ? frame.height / 1.8 : frame.height / 1.5
		let lightConfiguration = UIImage.SymbolConfiguration(pointSize: pointSize, weight: .light)
		let newImageName = buttonIsPressed ? "chevron.down" : "plus"
		if let newImage = UIImage(systemName: newImageName, withConfiguration: lightConfiguration)?.withTintColor(.white, renderingMode: .alwaysOriginal) {
			setImage(newImage, for: .normal)
		} else {
			assert(false, "Couldn't find the image from systemName: \(newImageName)")
		}
	}
	
	private final func decorateButton() {
		//make a plus image take 66% of a button view
		let lightConfiguration = UIImage.SymbolConfiguration(pointSize: frame.height / 1.5, weight: .light)
		if let image = UIImage(systemName: imageName, withConfiguration: lightConfiguration)?.withTintColor(.white, renderingMode: .alwaysOriginal) {
			setImage(image, for: .normal)
			backgroundColor = .dailyTabBarColor
			layer.cornerRadius = frame.height / 2
			layer.borderWidth = frame.height / 15
			layer.borderColor = UIColor.white.cgColor
			layer.shadowColor = UIColor.dailyShadowColor
			layer.shadowOffset = CGSize(width: 0, height: 10)
			layer.shadowRadius = 4
			layer.shadowOpacity = 0.1
		} else {
			assert(false, "Couldn't find the image from systemName: \(imageName)")
		}
		
	}
    
}
