//
//  OverlayVC.swift
//  Daily
//
//  Created by Арсений Токарев on 17.11.2020.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

class OverlayVC: UIViewController {
	var interactor: OverlayBusinessLogic?

	internal var cellsToDisplay: [[DailyCell]] = [[DailyCell]]()
	internal let saveButton = UIButton(type: .system)
	internal let cancelButton = UIButton(type: .system)
	internal let titleLabel = UILabel()
	internal let tableView = UITableView()
	internal let textFieldView = TextFieldView()
	
	override func loadView() {
		super.loadView()
		configureUI()
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		interactor?.fetchCells()
		view.backgroundColor = .dailyTabBarColor
		cancelButton.addTarget(self, action: #selector(didTapCancelButton), for: .touchUpInside)
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		tableView.estimatedRowHeight = 55
		tableView.rowHeight = UITableView.automaticDimension
	}
	
	@objc func didTapCancelButton() {
		cancelButton.tapAnimation { [weak self] in
			guard let self = self else { return }
			self.remove()
			NotificationCenter.default.post(name: Notification.Name("Close Overlay"), object: nil)
		}
	}
	
	func styleUI() {
		saveButton.styleOverlayButton(buttonType: .save)
		cancelButton.styleOverlayButton(buttonType: .cancel)
	}
}

//MARK: - Display Logic Protocol

extension OverlayVC: OverlayDisplayLogic {
	
	func delete(at indexPath: IndexPath) {
			tableView.beginUpdates()
			tableView.deleteRows(at: [indexPath], with: .automatic)
			tableView.endUpdates()
	}
	
	func insert(at indexPath: IndexPath) {
		tableView.beginUpdates()
		tableView.insertRows(at: [indexPath], with: .automatic)
		cellsToDisplay[indexPath.section][indexPath.row].delegate = self
		tableView.endUpdates()
	}
	
	func update(at indexPath: IndexPath) {
		tableView.reloadData()
	}
	
	func displayCells() {
		cellsToDisplay.forEach({ (cellsInSection) in
			cellsInSection.forEach { (cellInRow) in
				cellInRow.delegate = self
			}
		})
		tableView.reloadData()
	}
}



//MARK: - OverlayVC TableView Delegate and DataSource

extension OverlayVC: UITableViewDelegate, UITableViewDataSource {

	func numberOfSections(in tableView: UITableView) -> Int {
		return cellsToDisplay.count
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return cellsToDisplay[section].count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		return cellsToDisplay[indexPath.section][indexPath.row]
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		tableView.deselectRow(at: indexPath, animated: true)
		interactor?.didTapCellAt(indexPath: indexPath)
	}
	
	func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
		let header = UIView()
		header.backgroundColor = .dailyTabBarColor
		return header
	}
	
	func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
		return 20
	}
	
}

//MARK: - Custom Delegates

extension OverlayVC: DailyDatePickerCellDelegate {
	func didChangeDate(newDay: Date) {
		interactor?.didChangeValueInDatePickerCell(newDay: newDay)
	}
	
}

extension OverlayVC: DailyTimeCellDelegate {
	func didToggleTimeSwitcher() {
		interactor?.didToggleTimeSwitcher()
	}
}

extension OverlayVC: DailyTimePickerCellDelegate {
	func didChangeTime(newTime: Date) {
		interactor?.didChangeValueInTimePickerCell(newTime: newTime)
	}
}

extension OverlayVC: UITextFieldDelegate {
	
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		textFieldView.headerTextField.resignFirstResponder()
		return true
	}
	
	func textFieldDidEndEditing(_ textField: UITextField) {
		interactor?.didChangeTitle(text: textField.text)
	}
}

// MARK: - Configuration of UI elements

extension OverlayVC {
	
	func configureUI() {
		view.addSubview(titleLabel)
		view.addSubview(saveButton)
		view.addSubview(cancelButton)
		view.addSubview(tableView)
		
		configureLabel()
		configureButtons()
		configureTableView()
	}
	
	func configureTableView() {
		styleTableView()
		registerCellsInTableView()
		
		NSLayoutConstraint.activate([
			tableView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 30),
			tableView.bottomAnchor.constraint(equalTo: saveButton.topAnchor, constant: -15),
			tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
			tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10)
		])
	}

	func configureLabel() {
		NSLayoutConstraint.activate([
			titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 15),
			titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
			titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -view.bounds.width / 4)
		])
	}
	
	func configureButtons() {
		NSLayoutConstraint.activate([
			saveButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
			saveButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10),
			
			cancelButton.trailingAnchor.constraint(equalTo: saveButton.leadingAnchor, constant: -5),
			cancelButton.bottomAnchor.constraint(equalTo: saveButton.bottomAnchor),
		])
	}
}


// MARK: - Preparation of TABLE VIEW

extension OverlayVC {
	func styleTableView() {
		tableView.delegate = self
		tableView.dataSource = self
		tableView.backgroundColor = .clear
		tableView.translatesAutoresizingMaskIntoConstraints = false
		tableView.alwaysBounceVertical = false
		tableView.showsVerticalScrollIndicator = false
		tableView.showsHorizontalScrollIndicator = false
		tableView.layer.cornerRadius = 10
		
		textFieldView.frame.size = CGSize(width: tableView.frame.width, height: 45)
		tableView.tableHeaderView = textFieldView
		textFieldView.headerTextField.delegate = self
		tableView.tableHeaderView?.layer.cornerRadius = 10
		tableView.tableFooterView = UIView(frame: .zero)
	}
	
	func registerCellsInTableView() {
		tableView.register(DailyRemindCell.self, forCellReuseIdentifier: DailyRemindCell.cellIdentifier)
		tableView.register(DailyRepeatCell.self, forCellReuseIdentifier: DailyRepeatCell.cellIdentifier)
		tableView.register(DailyTeamProjectCell.self, forCellReuseIdentifier: DailyTeamProjectCell.cellIdentifier)
		tableView.register(DailyTimeCell.self, forCellReuseIdentifier: DailyTimeCell.cellIdentifier)
		tableView.register(DailyTimePickerCell.self, forCellReuseIdentifier: DailyTimePickerCell.cellIdentifier)
		tableView.register(DailyDatePickerCell.self, forCellReuseIdentifier: DailyDatePickerCell.cellIdentifier)
		tableView.register(DailyRequiredDateCell.self, forCellReuseIdentifier: DailyRequiredDateCell.cellIdentifier)
		tableView.register(DailyOptionalDateCell.self, forCellReuseIdentifier: DailyOptionalDateCell.cellIdentifier)
	}
}