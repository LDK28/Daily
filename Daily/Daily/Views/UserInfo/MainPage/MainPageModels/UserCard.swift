//
//  UserCard.swift
//  Daily
//
//  Created by Арсений Токарев on 08.12.2020.
//

import UIKit

class UserCard: UIView {
	private let usernameLabel = UILabel()
	private let userImageView = UIImageView()
	var userName: String? {
		didSet {
			guard let userName = userName else { return }
			usernameLabel.text = userName
		}
	}
	
	override func layoutSubviews() {
		super.layoutSubviews()
		layer.cornerRadius = 15
		layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
		userImageView.layer.cornerRadius = userImageView.frame.size.height / 2
		userImageView.clipsToBounds = true
	}
	
	init() {
		super.init(frame: .zero)
		self.backgroundColor = .dailyProfileTileColor
		userImageView.translatesAutoresizingMaskIntoConstraints = false
		userImageView.backgroundColor = .dailyTabBarSelectedItemColor
		userImageView.contentMode = .scaleAspectFill
		userImageView.layer.borderWidth = 4
		userImageView.layer.borderColor = UIColor.white.cgColor
		
		usernameLabel.styleLabel(font: UIFont(name: "Stolzl-Book",
											  size: 24),
								 text: "Username",
								 textAlignment: .center,
								 textColor: .dailyTextColor,
								 numberOfLines: 1)

		addSubview(userImageView)
		addSubview(usernameLabel)
		let imageWidth = UIScreen.main.bounds.width / 4
		NSLayoutConstraint.activate([
			userImageView.topAnchor.constraint(equalTo: topAnchor, constant: 5),
			userImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
			userImageView.heightAnchor.constraint(equalToConstant: imageWidth),
			userImageView.widthAnchor.constraint(equalTo: userImageView.heightAnchor),
			
			usernameLabel.topAnchor.constraint(equalTo: userImageView.bottomAnchor, constant: 15),
			usernameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
			usernameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
			usernameLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20)
		])
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
