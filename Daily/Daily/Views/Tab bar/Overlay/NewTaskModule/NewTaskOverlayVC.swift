//
//  NewTaskOverlayVC.swift
//  Daily
//
//  Created by Арсений Токарев on 02.11.2020.
//

import UIKit

protocol  NewTaskOverlayDisplayLogic: class {
	func display(data: DailyDataSource)
}

class NewTaskOverlayVC: OverlayTemplateVC {
	var interactor: NewTaskOverlayBusinessLogic?
	var cellItemsToDisplay: DailyDataSource?
	
	private let tableView: UITableView = {
		let table = UITableView()
		
		return table
	}()
	
	override func loadView() {
		super.loadView()
		
		view.addSubview(tableView)
		
		styleElements()
		
		configureTableView()
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		interactor?.fetchCells()
    }
	
	func configureTableView() {
		tableView.delegate = self
		tableView.dataSource = self
		tableView.translatesAutoresizingMaskIntoConstraints = false
		tableView.tableFooterView = UIView(frame: .zero)
		NSLayoutConstraint.activate([
			tableView.topAnchor.constraint(equalTo: headerTextField.bottomAnchor, constant: 15),
			tableView.bottomAnchor.constraint(equalTo: saveButton.topAnchor, constant: -15),
			tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
			tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10)
		])
	}
	
	override func styleElements() {
		super.styleElements()
		titleLabel.styleOverlayLabel(text: "Make new task")
	}
}


// MARK: - Table View Delegate and DataSource

extension NewTaskOverlayVC: UITableViewDelegate, UITableViewDataSource {
	
	func numberOfSections(in tableView: UITableView) -> Int {
		cellItemsToDisplay?.items.count ?? 0
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		cellItemsToDisplay?.items[section].rowCount ?? 0
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		return UITableViewCell()
	}
	
	
}

// MARK: - View Protocol

extension NewTaskOverlayVC: NewTaskOverlayDisplayLogic {
	func display(data: DailyDataSource) {
		cellItemsToDisplay?.items.removeAll()
		cellItemsToDisplay?.items.append(contentsOf: data.items)
		tableView.reloadData()
	}
	
}
