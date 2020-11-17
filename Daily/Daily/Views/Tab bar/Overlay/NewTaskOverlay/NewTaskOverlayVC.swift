//
//  NewTaskOverlayVC.swift
//  Daily
//
//  Created by Арсений Токарев on 17.11.2020.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

class NewTaskOverlayVC: OverlayVC {
	
	var router: (NewTaskOverlayRoutingLogic & NewTaskOverlayDataPassing)?
  
	override func loadView() {
		super.loadView()
		configureTableView()
		styleUI()
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

extension NewTaskOverlayVC: DailyRemindCellDelegate {
	func didToggleRemindState() {
		(interactor as? NewTaskOverlayInteractor)?.didToggleRemindSwitcher()
	}
}
