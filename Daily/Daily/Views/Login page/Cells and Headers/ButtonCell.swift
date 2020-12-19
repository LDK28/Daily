//
//  ButtonCell.swift
//  Daily
//
//  Created by Арсений Токарев on 19.12.2020.
//

import UIKit

struct ButtonCellViewModel: MainCellViewModel {
	var cellType: UITableViewCell.Type
	var title: String
	var backgroundColor: UIColor
	var foregroundColor = UIColor.dailyTextColor
	
}

class ButtonCell: UITableViewCell, MainCellProtocol {
	internal let button = UIButton(type: .system)
	
	func setViewModel(_ viewModel: MainCellViewModel?) {
		guard let viewModel = viewModel as? ButtonCellViewModel else { return }
		button.styleAccountButton(title: viewModel.title,
								  backgroundColor: viewModel.backgroundColor,
								  foregroundColor: viewModel.foregroundColor)
	}
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		backgroundColor = .clear
		contentView.addSubview(button)
		selectedBackgroundView = UIView()
		NSLayoutConstraint.activate([
			button.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
			button.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
			button.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
			button.heightAnchor.constraint(equalToConstant: 50)
		])
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

final class LoginButtonCell: ButtonCell {
	static let cellIdentifier = "LoginButtonCell"
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		button.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 25).isActive = true
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

// MARK: - Singing in
class RegisterUserButtonCell: ButtonCell {
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		button.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5).isActive = true
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

final class SignupButtonCell: RegisterUserButtonCell {
	static let cellIdentifier = "SignupButtonCell"
}

final class ContinueWithoutLoginInCell: RegisterUserButtonCell {
	static let cellIdentifier = "ContinueWithoutLoginInCell"
	
}

