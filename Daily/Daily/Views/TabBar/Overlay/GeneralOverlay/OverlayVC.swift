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
	weak var delegate: TabBarModuleChangedDelegate?

	internal var cellsToDisplay = [DailySectionViewModel]()
	internal let saveButton = UIButton(type: .system)
	internal let cancelButton = UIButton(type: .system)
	internal let tableView = UITableView()
	internal var headerView: OverlayHeader?
	
	override func loadView() {
		super.loadView()
		setupHideKeyboardOnTap()
		configureUI()
		headerView?.headerTextField.delegate = self
		tableView.setAndLayoutTableHeaderView(header: headerView)
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
}

//MARK: - Display Logic Protocol

extension OverlayVC: OverlayDisplayLogic {
	
	func delete(at indexPaths: [IndexPath]) {
			tableView.beginUpdates()
			tableView.deleteRows(at: indexPaths, with: .fade)
			tableView.endUpdates()
	}
	
	func insert(at indexPaths: [IndexPath]) {
		tableView.beginUpdates()
		tableView.insertRows(at: indexPaths, with: .fade)
		tableView.endUpdates()
	}
	
	func updateViewModelForCell(at indexPath: IndexPath) {
		(tableView.cellForRow(at: indexPath) as? DailyCell)?.setViewModel(cellsToDisplay[indexPath.section].cellViewModels[indexPath.row])

	}
	
	func displayCells() {
		tableView.reloadData()
	}
}

//MARK: - OverlayVC TableView Delegate and DataSource
extension OverlayVC: UITableViewDelegate, UITableViewDataSource {

	func numberOfSections(in tableView: UITableView) -> Int {
		return cellsToDisplay.count
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return cellsToDisplay[section].cellViewModels.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cellViewModel = cellsToDisplay.getViewModel(at: indexPath)
		if let cell = tableView.dequeueReusableCell(withIdentifier: "\(cellViewModel.cellType)") as? UIElementContainerCell {
			cell.setViewModel(cellViewModel)
			cell.delegate = self
			return cell
		}
		return UITableViewCell()
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		tableView.deselectRow(at: indexPath, animated: true)
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
		headerView?.headerTextField.resignFirstResponder()
		return true
	}
	
	func textFieldDidEndEditing(_ textField: UITextField) {
		interactor?.didChangeTitle(text: textField.text)
	}
}

// MARK: - Configuration of UI elements

extension OverlayVC {
	
	func configureUI() {
		view.addSubview(saveButton)
		view.addSubview(cancelButton)
		view.addSubview(tableView)
	
		configureButtons()
		configureTableView()
		
		styleUI()
	}
	
	func styleUI() {
		saveButton.styleOverlayButton(buttonType: .save)
		cancelButton.styleOverlayButton(buttonType: .cancel)
	}
	
	func configureTableView() {
		styleTableView()
		registerCellsInTableView()
		
		NSLayoutConstraint.activate([
			tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 15),
			tableView.bottomAnchor.constraint(equalTo: saveButton.topAnchor, constant: -15),
			tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
			tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10)
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
		tableView.tableFooterView = UIView(frame: CGRect(x: 0,
														 y: 0,
														 width: tableView.frame.size.width,
														 height: 1))
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
		tableView.register(OverlayDescriptionTextViewCell.self, forCellReuseIdentifier: OverlayDescriptionTextViewCell.cellIdentifier)
	}
}
