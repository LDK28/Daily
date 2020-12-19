//
//  TextFieldCell.swift
//  Daily
//
//  Created by Арсений Токарев on 19.12.2020.
//

import UIKit

struct TextFieldCellViewModel: MainCellViewModel {
	var cellType: UITableViewCell.Type
	var placeholder: String
	var isFirstLetterAutoCapitalized: Bool
	var isSecuredString: Bool
}

class TextFieldCell: UITableViewCell, MainCellProtocol {
	static let cellIdentifier = "TextFieldCell"
	private let textField = UITextField()
	
	func setViewModel(_ viewModel: MainCellViewModel?) {
		guard let viewModel = viewModel as? TextFieldCellViewModel else { return }
		textField.styleTextField(placeholder: viewModel.placeholder,
								 isFirstLetterAutoCapitalized: viewModel.isFirstLetterAutoCapitalized,
								 isSecuredString: viewModel.isSecuredString)
	}

	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		backgroundColor = .clear
		selectedBackgroundView = .none
		contentView.addSubview(textField)
		NSLayoutConstraint.activate([
			textField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
			textField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
			textField.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
			textField.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
			textField.heightAnchor.constraint(equalToConstant: 45)
		])
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
}
