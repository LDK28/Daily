//
//  GreetingView.swift
//  Daily
//
//  Created by Арсений Токарев on 19.12.2020.
//

import UIKit

class AuthorizationTitleView: UIView {
	let label = UILabel()
	init(text: String) {
		super.init(frame: .zero)
		label.styleLabel(font: UIFont(name: "Stolzl-Light", size: 38),
								 text: text,
								 textAlignment: .center)
		label.adjustsFontSizeToFitWidth = true
		addSubview(label)
		let topAnchorConstant = UIScreen.main.bounds.height * 1 / 10
		NSLayoutConstraint.activate([
			label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
			label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
			label.topAnchor.constraint(equalTo: topAnchor, constant: topAnchorConstant),
			label.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20)
		])
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
