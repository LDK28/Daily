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
		
		styleUI()
		
		configureTableView()
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		interactor?.fetchCells()
    }
	
	
	override func styleUI() {
		super.styleUI()
		titleLabel.styleOverlayLabel(text: "Add new task")
	}
}

extension NewTaskOverlayVC: DailyTimeCellDelegate {
	func didToggleTimeSwitcher() {
		interactor?.didToggleTimeSwitcher()
	}
}
