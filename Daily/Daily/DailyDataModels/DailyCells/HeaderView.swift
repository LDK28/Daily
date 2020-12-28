//
//  HeaderCell.swift
//  Daily
//
//  Created by Арсений Токарев on 08.11.2020.
//

import UIKit

class OverlayHeader: UIView {
	weak var delegate: UIViewController?
	
	private let titleLabel = UILabel()
	let headerTextField = UITextField()
	
	init(title: String?) {
		super.init(frame: .zero)
		headerTextField.styleOverlayTextField(placeholder: "Title")
		titleLabel.styleOverlayLabel(text: title)
		backgroundColor = .clear
		addSubview(headerTextField)
		addSubview(titleLabel)
		NSLayoutConstraint.activate([
			headerTextField.bottomAnchor.constraint(equalTo: bottomAnchor),
			headerTextField.leadingAnchor.constraint(equalTo: leadingAnchor),
			headerTextField.trailingAnchor.constraint(equalTo: trailingAnchor),
			headerTextField.heightAnchor.constraint(equalToConstant: 45),
			
			titleLabel.topAnchor.constraint(equalTo: topAnchor),
			titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
			titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
			titleLabel.bottomAnchor.constraint(equalTo: headerTextField.topAnchor, constant: -30),
		])
		
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
