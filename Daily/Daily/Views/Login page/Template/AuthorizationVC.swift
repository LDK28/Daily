//
//  AuthorizationVC.swift
//  Daily
//
//  Created by Арсений Токарев on 19.12.2020.
//  Copyright (c) 2020. All rights reserved.
//

import UIKit

class AuthorizationVC: MainTableVC {
	var interactor: AuthorizationBusinessLogic?
	var router: AuthorizationRoutingLogic?
  
	override func loadView() {
		super.loadView()
		configureTableView()
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		interactor?.fetchCells()
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		navigationController?.setNavigationBarHidden(true, animated: false)
		view.subviews
			.compactMap{ $0 as? UITextField }
			.forEach {
				$0.text = nil
			}
	}
	
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		tableView.scrollToRow(at: indexPath, at: .middle, animated: true)
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cellViewModel = cellsToDisplay[indexPath.row]
		if let cell = tableView.dequeueReusableCell(withIdentifier: "\(cellViewModel.cellType)") as? UIElementContainerCell {
			cell.setViewModel(cellViewModel)
			cell.delegate = self
			return cell
		}
		return UITableViewCell()
	}
  
}


extension AuthorizationVC: AuthorizationDisplayLogic {
	func displayCells() {
		tableView.reloadData()
	}
	
	func handleValidationResponse(message: String) {
		UIImpactFeedbackGenerator(style: .heavy).impactOccurred()
		tableView.reloadData()
		//showError(message)
	}
	
	func routeToApp() {
		router?.navigateTo(.app)
	}
}

extension AuthorizationVC: EmailTextFieldDelegate {
	func changedEmail(_ email: String?) {
		interactor?.didChangeEmail(email)
	}
}

extension AuthorizationVC: PasswordTextFieldDelegate {
	func changedPassword(_ password: String?) {
		interactor?.didChangePassword(password)
	}
}

extension AuthorizationVC {
	@objc func configureTableView() {
		tableView.delegate = self
		tableView.dataSource = self
		tableView.delaysContentTouches = false
		tableView.showsVerticalScrollIndicator = false
		tableView.separatorStyle = .none
		tableView.register(EmailTextFieldCell.self,
						   forCellReuseIdentifier: EmailTextFieldCell.cellIdentifier)
		tableView.register(PasswordTextFieldCell.self,
						   forCellReuseIdentifier: PasswordTextFieldCell.cellIdentifier)
	}
}
