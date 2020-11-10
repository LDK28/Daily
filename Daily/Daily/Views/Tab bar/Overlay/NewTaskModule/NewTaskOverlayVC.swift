//
//  NewTaskOverlayVC.swift
//  Daily
//
//  Created by Арсений Токарев on 02.11.2020.
//

import UIKit

protocol  NewTaskOverlayDisplayLogic: class {
	func display(cells: [[UITableViewCell]])
}

class NewTaskOverlayVC: OverlayTemplateVC {
	var interactor: NewTaskOverlayBusinessLogic?
	
	override func loadView() {
		super.loadView()
		
		styleElements()
		
		configureTableView()
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		interactor?.fetchCells(in: tableView)
    }
	
	
	override func styleElements() {
		super.styleElements()
		titleLabel.styleOverlayLabel(text: "Add new task")
	}
}


// MARK: - Table View Delegate and DataSource

// MARK: - View Protocol

extension NewTaskOverlayVC: NewTaskOverlayDisplayLogic {
	func display(cells: [[UITableViewCell]]) {
		self.cellsToDisplay = cells
		tableView.reloadData()
	}
	
}
