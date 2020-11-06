//
//  NewTaskOverlayVC.swift
//  Daily
//
//  Created by Арсений Токарев on 02.11.2020.
//

import UIKit

protocol NewTaskOverlayViewProtocol: class {
	func styleElements()
	func configureTableView()
}

class NewTaskOverlayVC: OverlayTemplateVC, NewTaskOverlayViewProtocol {
	var interactor: NewTaskOverlayInteractorProtocol?
	let model = NewTaskViewModel()
	
	private let tableView: UITableView = {
		let table = UITableView()
		table.register(CustomCell.self, forCellReuseIdentifier: "Custom Cell")
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
		
		tableView.delegate = self
		tableView.dataSource = self
    }
	
	func configureTableView() {
		tableView.translatesAutoresizingMaskIntoConstraints = false
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


extension NewTaskOverlayVC: UITableViewDelegate, UITableViewDataSource {
	
	func numberOfSections(in tableView: UITableView) -> Int {
		return model.items.count
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return model.items[section].rowCount
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let item = model.items[indexPath.section]
		let cell = tableView.dequeueReusableCell(withIdentifier: "Custom Cell", for: indexPath) as! CustomCell
		cell.component = item.components[indexPath.row]
		return cell
	}
	
	
}
