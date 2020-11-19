//
//  AddButton.swift
//  Daily
//
//  Created by Арсений Токарев on 24.10.2020.
//
import UIKit

final class AddButton: UIButton {
	
	init(title: String, symbolName: String) {
		super.init(frame: .zero)
		
		setTitle(title, for: .normal)
		setImage(UIImage(systemName: symbolName), for: .normal)
		setTitleColor(.dailyTabBarSelectedItemColor, for: .normal)
		tintColor = .dailyTabBarSelectedItemColor
		backgroundColor = .dailyTabBarColor
		layer.cornerRadius = 5
		titleLabel?.font = UIFont(name: "Stolzl-Light", size: 16)
		contentHorizontalAlignment = .leading
		contentEdgeInsets = UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 15)
		titleEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
		titleLabel?.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15).isActive = true
		imageView?.contentMode = .scaleAspectFit
		
		
		
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
}
