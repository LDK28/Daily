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

class TextFieldCell: AuthorizationCell {
	private let textField = UITextField()
	
	override func setViewModel(_ viewModel: MainCellViewModel?) {
		guard let viewModel = viewModel as? TextFieldCellViewModel else { return }
		textField.styleTextField(placeholder: viewModel.placeholder,
								 isFirstLetterAutoCapitalized: viewModel.isFirstLetterAutoCapitalized,
								 isSecuredString: viewModel.isSecuredString)
	}
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		textField.delegate = self
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

extension TextFieldCell: UITextFieldDelegate {
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		textField.resignFirstResponder()
		return true
	}
}


protocol EmailTextFieldCellDelegate {
	func changedEmail(_ email: String?)
}

final class EmailTextFieldCell: TextFieldCell {
	static let cellIdentifier = "EmailTextFieldCell"
	
	func textFieldDidEndEditing(_ textField: UITextField) {
		(delegate as? EmailTextFieldCellDelegate)?.changedEmail(textField.text)
	}
}

protocol PasswordTextFieldCellDelegate {
	func changedPassword(_ password: String?)
}

final class PasswordTextFieldCell: TextFieldCell {
	static let cellIdentifier = "PasswordTextFieldCell"
	
	func textFieldDidEndEditing(_ textField: UITextField) {
		(delegate as? PasswordTextFieldCellDelegate)?.changedPassword(textField.text)
	}
}

