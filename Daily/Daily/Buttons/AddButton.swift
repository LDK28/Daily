//
//  AddButton.swift
//  Daily
//
//  Created by Арсений Токарев on 24.10.2020.
//

import UIKit

class AddButton: UIButton {
	
	private let title: String
	private let symbolName: String
	
	required init(title: String, symbolName: String) {
		self.title = title
		self.symbolName = symbolName
		super.init(frame: .zero)
		
		//Configuring SF Symbol that is on the left side
		var image = UIImage()
		if let validSymbolForImage = UIImage(systemName: symbolName) {
			image = validSymbolForImage
		} else {
			assert(false, "Couldn't load image from systemName: \(symbolName)")
		}
		let imageView = UIImageView(image: image)
		imageView.contentMode = .scaleAspectFill
		imageView.tintColor = .dailyTabBarSelectedItemColor
		
		//Configuring label(text) that is on the right side
		let label = UILabel()
		label.text = title
		label.font = UIFont(name: "Stolzl-Light", size: 16)
		label.textColor = .dailyTabBarSelectedItemColor
		
		//Putting both image and label in a HStack
		let hStack = UIStackView()
		hStack.axis = .horizontal
		hStack.spacing = 15
		hStack.addArrangedSubview(imageView)
		hStack.addArrangedSubview(label)
		hStack.translatesAutoresizingMaskIntoConstraints = false
		
		//Layout of HStack
		addSubview(hStack)
		hStack.heightAnchor.constraint(equalTo: self.heightAnchor, constant: -10 * 2).isActive = true
		hStack.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
		//hStack.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
		hStack.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
		
		backgroundColor = .dailyTabBarColor
		layer.cornerRadius = 5
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
}
