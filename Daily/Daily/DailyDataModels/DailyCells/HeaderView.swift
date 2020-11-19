//
//  HeaderCell.swift
//  Daily
//
//  Created by Арсений Токарев on 08.11.2020.
//

import UIKit

class TextFieldView: UIView {
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
			headerTextField.bottomAnchor.constraint(equalTo: bottomAnchor)
		])
		
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

