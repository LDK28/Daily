//
//  NewTaskOverlayVC.swift
//  Daily
//
//  Created by Арсений Токарев on 02.11.2020.
//

import UIKit

protocol  NewTaskOverlayDisplayLogic: OverlayDisplayLogic {
//	func display(cells: [[UITableViewCell]])
}

class NewTaskOverlayVC: OverlayVC {
	var interactor: NewTaskOverlayBusinessLogic?
	
	override func loadView() {
		super.loadView()
		
		styleElements()
		
		configureTableView()
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		interactor?.fetchCells()
    }
	
	
	override func styleElements() {
		super.styleElements()
		titleLabel.styleOverlayLabel(text: "Add new task")
	}
}

// MARK: - View Protocol

//extension NewTaskOverlayVC: NewTaskOverlayDisplayLogic {
//	func display(cells: [[UITableViewCell]]) {
//		cellsToDisplay = cells
//		cellsToDisplay?.forEach({ (cellsInSection) in
//			cellsInSection.forEach { (cellInRow) in
//				(cellInRow as? DailyTimeCell)?.parentView = self
//			}
//		})
//		tableView.reloadData()
//	}
//	
//}

extension NewTaskOverlayVC: DailyTimeCellDelegate {
	func didToggleTimeSwitcher() {
		interactor?.didToggleTimeSwitcher()
	}
}
