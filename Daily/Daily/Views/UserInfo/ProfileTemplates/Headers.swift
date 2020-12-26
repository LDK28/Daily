//
//  ProfileHeader.swift
//  Daily
//
//  Created by Арсений Токарев on 09.12.2020.
//

import UIKit

struct ProfileModel {
	var text: String?
	var image: UIImage?
}

class ProfileHeader: UIView {
	internal let label = UILabel()
	internal let imageView = UIImageView()
	
	func setHeader(withModel model: ProfileModel) {
		if let image = model.image {
			imageView.image = image.withRenderingMode(.alwaysOriginal)
		}
		
		if let text = model.text {
			label.text = text
		}
	}
	
	init() {
		super.init(frame: .zero)
		self.backgroundColor = .dailyProfileTileColor
		imageView.translatesAutoresizingMaskIntoConstraints = false
		imageView.contentMode = .scaleAspectFill

		addSubview(imageView)
		addSubview(label)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

class UserCard: ProfileHeader {
	private let textField = UITextField()
	
	override func layoutSubviews() {
		super.layoutSubviews()
		imageView.layer.cornerRadius = imageView.frame.size.height / 2
		imageView.clipsToBounds = true
	}
	
	override init() {
		super.init()
		imageView.backgroundColor = .dailyTabBarSelectedItemColor
		imageView.layer.borderWidth = 4
		imageView.layer.borderColor = UIColor.white.cgColor
		
		label.styleLabel(font: UIFont(name: "Stolzl-Book",
									  size: 24),
						 text: " ",
						 textAlignment: .center,
						 textColor: .dailyTextColor,
						 numberOfLines: 1)
	
		let imageWidth = UIScreen.main.bounds.width / 4
		NSLayoutConstraint.activate([
			imageView.topAnchor.constraint(equalTo: topAnchor, constant: 5),
			imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
			imageView.heightAnchor.constraint(equalToConstant: imageWidth),
			imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor),
			
			label.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 15),
			label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
			label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
			label.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
		])
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

class MenuItemCard: ProfileHeader {
	override init() {
		super.init()
		label.styleLabel(font: UIFont(name: "Stolzl-Bold",
									  size: 34),
						 text: " ",
						 textAlignment: .center,
						 textColor: .dailyTitleTextColor,
						 numberOfLines: 1)
		
		let imageWidth: CGFloat = 30
		NSLayoutConstraint.activate([
			imageView.topAnchor.constraint(equalTo: topAnchor, constant: 5),
			imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
			imageView.heightAnchor.constraint(equalToConstant: imageWidth),
			imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor),
			
			label.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 5),
			label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
			label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
			label.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20)
		])
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
