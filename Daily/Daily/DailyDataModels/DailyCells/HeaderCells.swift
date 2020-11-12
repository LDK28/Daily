//
//  HeaderCell.swift
//  Daily
//
//  Created by Арсений Токарев on 08.11.2020.
//

import UIKit

class TitleTextFieldCell: UITableViewCell {
	static let cellIdentifier = "TitleTextFieldCell"
	
	let headerTextField = UITextField()
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		headerTextField.styleOverlayTextField(placeholder: "Title")
		backgroundColor = .clear
		
		contentView.addSubview(headerTextField)
		NSLayoutConstraint.activate([
			headerTextField.widthAnchor.constraint(equalTo: contentView.widthAnchor),
			headerTextField.heightAnchor.constraint(equalToConstant: contentView.frame.height)
		])
		
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

}


