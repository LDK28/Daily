//
//  HeaderCell.swift
//  Daily
//
//  Created by Арсений Токарев on 08.11.2020.
//

import UIKit

class HeaderTextFieldView: UIView {
	let headerTextField = UITextField()
	
	init() {
		super.init(frame: .zero)
		headerTextField.styleOverlayTextField(placeholder: "Title")
		backgroundColor = .clear
		
		addSubview(headerTextField)
		NSLayoutConstraint.activate([
			headerTextField.leadingAnchor.constraint(equalTo: leadingAnchor),
			headerTextField.trailingAnchor.constraint(equalTo: trailingAnchor),
			headerTextField.topAnchor.constraint(equalTo: topAnchor),
			headerTextField.bottomAnchor.constraint(equalTo: bottomAnchor),
			headerTextField.heightAnchor.constraint(equalToConstant: 45)
		])
		
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

