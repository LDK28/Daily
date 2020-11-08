//
//  OverlayTemplateVC.swift
//  Daily
//
//  Created by Арсений Токарев on 04.11.2020.
//

import UIKit

class OverlayTemplateVC: UIViewController {

	internal let saveButton = UIButton(type: .system)
	internal let cancelButton = UIButton(type: .system)
	internal let titleLabel = UILabel()
	internal let tableView = UITableView()
	
	
	override func loadView() {
		super.loadView()

		view.addSubview(titleLabel)
		view.addSubview(saveButton)
		view.addSubview(cancelButton)
		view.addSubview(tableView)
		
		styleElements()
		
		configureLabel()
		configureButtons()
		configureTableView()
		
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()
		view.backgroundColor = .dailyTabBarColor
		
		cancelButton.addTarget(self, action: #selector(didTapCancelButton), for: .touchUpInside)
    }
	
	@objc func didTapCancelButton() {
		self.remove()
		NotificationCenter.default.post(name: Notification.Name("Close Overlay"), object: nil)
	}
	
	func configureTableView() {
		//configuration
		tableView.delegate = self
		tableView.dataSource = self
		tableView.backgroundColor = .clear
		tableView.translatesAutoresizingMaskIntoConstraints = false
		tableView.alwaysBounceVertical = false
		tableView.showsVerticalScrollIndicator = false
		tableView.showsHorizontalScrollIndicator = false
		
		//cells registraion
		tableView.register(DailyOrdinaryCell.self, forCellReuseIdentifier: DailyOrdinaryCell.cellIdentifier)
		tableView.register(DailyTimeCell.self, forCellReuseIdentifier: DailyTimeCell.cellIdentifier)
		tableView.register(DailyNewTaskDateCell.self, forCellReuseIdentifier: DailyNewTaskDateCell.cellIdentifier)
		tableView.register(DailyNewProjectDateCell.self, forCellReuseIdentifier: DailyNewProjectDateCell.cellIdentifier)
		tableView.register(TitleTextFieldCell.self, forCellReuseIdentifier: TitleTextFieldCell.cellIdentifier)
		tableView.register(DescriptionCell.self, forCellReuseIdentifier: DescriptionCell.cellIdentifier)
		
		
		//adding header and default footer(empty view)
		tableView.tableHeaderView = tableView.dequeueReusableCell(withIdentifier: TitleTextFieldCell.cellIdentifier)?.contentView
		tableView.tableFooterView = UIView(frame: .zero)
		
		//layuout
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
	
	func styleElements() {
		saveButton.styleOverlayButton(buttonType: .save)
		cancelButton.styleOverlayButton(buttonType: .cancel)
	}
}


//MARK: - OverlayTemplateVC TableView Delegate and DataSource

extension OverlayTemplateVC: UITableViewDelegate, UITableViewDataSource {
	//MARK: Default implementation of dlegate and dataSource functions
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 0
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
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
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 50
	}
	
}
