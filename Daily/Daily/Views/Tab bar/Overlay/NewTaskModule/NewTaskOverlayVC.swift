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
		table.register(DailyCell.self, forCellReuseIdentifier: DailyCell.cellIdentifier)
		table.layer.cornerRadius = 10
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
		
		/*
			This is an initial state of the VIP cycle. Once our view appears and gets loaded we start this cycle for the first time: VIEW calls INTERACTOR -> it does something or nothing with our DATASOURCE -> then DATASOURCE is sent to PRESENTER that prepares our raw data for our VIEW to show -> VIEW recieves rendered DATASOURCE and shows contents accordingly
		
			However, in our case DailyDataSource is not affected by any of the VIP cycle members, because the content that table view shows in this module is static and has no requests to a server or something else. Therefore, our DATASOURCE merely gets transfered from one VIP member to another, but it is inevitable
		
			In addition, we will have methods that will be called from table view (e.g. didSelectRowAt to expand time and date calendar). At this point, VIP cycle will become really handy
		*/
		
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
		//items represent an array of section
		return cellItemsToDisplay?.items.count ?? 0
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		//each section in the array of items has definite amount of cells
		return cellItemsToDisplay?.items[section].rowCount ?? 0
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		if let cell = tableView.dequeueReusableCell(withIdentifier: DailyCell.cellIdentifier, for: indexPath) as? DailyCell {
			cell.component = cellItemsToDisplay?.items[indexPath.section].components[indexPath.row]
			return cell
		}
		return UITableViewCell()
	}
	
	
}

// MARK: - View Protocol

extension NewTaskOverlayVC: NewTaskOverlayDisplayLogic {
	func display(data: DailyDataSource) {
		cellItemsToDisplay = data
		tableView.reloadData()
	}
	
}
