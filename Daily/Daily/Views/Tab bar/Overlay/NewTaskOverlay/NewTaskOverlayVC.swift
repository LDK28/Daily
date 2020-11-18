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
}

extension NewTaskOverlayVC: DailyRemindCellDelegate {
	func didToggleRemindState() {
		(interactor as? NewTaskOverlayInteractor)?.didToggleRemindSwitcher()
	}
}

extension NewTaskOverlayVC {
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		tableView.deselectRow(at: indexPath, animated: true)
		guard ((cellsToDisplay[indexPath.section][indexPath.row] as? DailyRepeatCell) != nil) else { return }
		(interactor as? NewTaskOverlayInteractor)?.didTapRepeatCell()
	}
}
