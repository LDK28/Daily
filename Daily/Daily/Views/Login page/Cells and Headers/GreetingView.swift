//
//  GreetingView.swift
//  Daily
//
//  Created by Арсений Токарев on 19.12.2020.
//

import UIKit

class GreetingView: UIView {
	let greetingLabel = UILabel()
	
	init() {
		super.init(frame: .zero)
		greetingLabel.styleLabel(font: UIFont(name: "Stolzl-Light", size: 32),
								 text: "Welcome to Daily",
								 textAlignment: .center,
								 numberOfLines: 0)
		addSubview(greetingLabel)
		NSLayoutConstraint.activate([
			greetingLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
			greetingLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
			greetingLabel.topAnchor.constraint(equalTo: topAnchor, constant: 100),
			greetingLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20)
		])
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
