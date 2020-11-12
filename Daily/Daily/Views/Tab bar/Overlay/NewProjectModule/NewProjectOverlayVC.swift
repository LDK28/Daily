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


class NewProjectOverlayVC: OverlayVC {
	
	var interactor: NewProjectOverlayBusinessLogic?
	
	override func loadView() {
		super.loadView()
		
		styleElements()
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		interactor?.fetchCells()
	}
	
	
	override func styleElements() {
		super.styleElements()
		titleLabel.styleOverlayLabel(text: "Create new project")
	}

}

extension  NewProjectOverlayVC: NewProjectOverlayDisplayLogic {
	func display(cells: [[UITableViewCell]]) {
		cellsToDisplay = cells
		cellsToDisplay?.forEach({ (cellsInSection) in
			cellsInSection.forEach { (cellInRow) in
				(cellInRow as? DailyTimeCell)?.parentView = self
			}
		})
		
		tableView.reloadData()
	}
}

extension NewProjectOverlayVC: DailyTimeCellDelegate {
	func didToggleTimeSwitcher() {
		interactor?.didToggleTimeSwitcher()
	}
}
