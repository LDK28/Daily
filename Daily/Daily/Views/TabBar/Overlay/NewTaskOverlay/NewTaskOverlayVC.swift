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
		styleUI()
	}
	
	override func styleUI() {
		super.styleUI()
		titleLabel.styleOverlayLabel(text: "Add new task")
	}
	
	override func tableView(_ tableView: UITableView,
							didSelectRowAt indexPath: IndexPath) {
		super.tableView(tableView, didSelectRowAt: indexPath)
		if tableView.cellForRow(at: indexPath) as? DailyRepeatCell != nil {
			(interactor as? NewTaskOverlayInteractor)?.didTapRepeatCell(at: indexPath)
		}
		
		if tableView.cellForRow(at: indexPath) as? DailyRequiredDateCell != nil {
			(interactor as? NewTaskOverlayInteractor)?.didTapDateCell(at: indexPath)
		}
	}
}

extension NewTaskOverlayVC: DailyRemindCellDelegate {
	func didToggleRemindState() {
		(interactor as? NewTaskOverlayInteractor)?.didToggleRemindSwitcher()
	}
}
