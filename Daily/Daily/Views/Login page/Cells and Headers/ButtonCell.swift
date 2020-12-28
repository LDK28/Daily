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

//MARK: - General model
class ButtonCell: UIElementContainerCell {
	internal let button = UIButton(type: .system)
	
	override func setViewModel(_ viewModel: MainCellViewModel?) {
		guard let viewModel = viewModel as? ButtonCellViewModel else { return }
		button.styleAccountButton(title: viewModel.title,
								  backgroundColor: viewModel.backgroundColor,
								  foregroundColor: viewModel.foregroundColor)
	}
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		contentView.addSubview(button)
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

//MARK: - Log in
protocol LoginButtonDelegate {
	func loginButtonTapped()
}

final class LoginButtonCell: ButtonCell {
	static let cellIdentifier = "LoginButtonCell"
	
	@objc func loginButtonTapped() {
		(delegate as? LoginButtonDelegate)?.loginButtonTapped()
	}
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		button.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 25).isActive = true
		button.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

// MARK: - Singing in
class SecondaryButtonCell: ButtonCell {
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		button.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5).isActive = true
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

//MARK: - Sign up
protocol SignupFromLoginButtonDelegate {
	func signupFromLoginButtonTapped()
}

final class SignupFromLoginButtonCell: SecondaryButtonCell {
	static let cellIdentifier = "SignupFromLoginButtonCell"
	
	@objc func signupFromLoginButtonTapped() {
		(delegate as? SignupFromLoginButtonDelegate)?.signupFromLoginButtonTapped()
	}
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		button.addTarget(self, action: #selector(signupFromLoginButtonTapped), for: .touchUpInside)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

protocol SignupButtonDelegate {
	func signupButtonTapped()
}

final class SignupButtonCell: ButtonCell {
	static let cellIdentifier = "SignupButtonCell"
	
	@objc func signupButtonTapped() {
		(delegate as? SignupButtonDelegate)?.signupButtonTapped()
	}
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		button.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 25).isActive = true
		button.addTarget(self, action: #selector(signupButtonTapped), for: .touchUpInside)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

//MARK: - Continue withour creating a user
final class ContinueWithoutLoginInCell: SecondaryButtonCell {
	static let cellIdentifier = "ContinueWithoutLoginInCell"
	
}

//MARK: - Already have an account
protocol AlreadyHaveAccountButtonDelegate {
	func alreadyHaveAccountButtonTapped()
}

final class AlreadyHaveAccountButtonCell: SecondaryButtonCell {
	static let cellIdentifier = "AlreadyHaveAccountButtonCell"
	
	@objc func alreadyHaveAccountButtonTapped() {
		(delegate as? AlreadyHaveAccountButtonDelegate)?.alreadyHaveAccountButtonTapped()
	}
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		button.addTarget(self, action: #selector(alreadyHaveAccountButtonTapped), for: .touchUpInside)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

