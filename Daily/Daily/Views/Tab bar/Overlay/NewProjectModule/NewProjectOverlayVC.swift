//
//  NewProjectOverlayVC.swift
//  Daily
//
//  Created by Арсений Токарев on 02.11.2020.
//

import UIKit

protocol NewProjectOverlayDisplayLogic: class {
	func display(cells: [[UITableViewCell]])
}


class NewProjectOverlayVC: OverlayTemplateVC {
	
	var interactor: NewProjectOverlayBusinessLogic?
	
	override func loadView() {
		super.loadView()
		
		styleElements()
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		interactor?.fetchCells(in: tableView)
	}
	
	
	override func styleElements() {
		super.styleElements()
		titleLabel.styleOverlayLabel(text: "Create new project")
	}

}

extension  NewProjectOverlayVC: NewProjectOverlayDisplayLogic {
	func display(cells: [[UITableViewCell]]) {
		cellsToDisplay = cells
		tableView.reloadData()
	}
}
