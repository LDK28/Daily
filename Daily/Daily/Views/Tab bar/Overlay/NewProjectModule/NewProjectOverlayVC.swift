//
//  NewProjectOverlayVC.swift
//  Daily
//
//  Created by Арсений Токарев on 02.11.2020.
//

import UIKit

protocol NewProjectOverlayDisplayLogic: OverlayDisplayLogic {
	
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

extension NewProjectOverlayVC: DailyTimeCellDelegate {
	func didToggleTimeSwitcher() {
		interactor?.didToggleTimeSwitcher()
	}
}

extension NewProjectOverlayVC: DailyOptionalDateCellDelegate {
	func didToggleDateSwitcher() {
		interactor?.didToggleDateSwitcher()
	}
}
