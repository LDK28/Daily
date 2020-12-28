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
		headerView = OverlayHeader(title: "Make new task")
		super.loadView()
	}
	
	override func tableView(_ tableView: UITableView,
							didSelectRowAt indexPath: IndexPath) {
		super.tableView(tableView, didSelectRowAt: indexPath)
		switch cellsToDisplay[indexPath.section].cellViewModels[indexPath.row].cellType {
		case is DailyRepeatCell.Type:
			(interactor as? NewTaskOverlayInteractor)?.didTapRepeatCell(at: indexPath)
		case is DailyRequiredDateCell.Type:
			(interactor as? NewTaskOverlayInteractor)?.didTapDateCell(at: indexPath)
		default:
			return
		}
	}
}

extension NewTaskOverlayVC: DailyRemindCellDelegate {
	func didToggleRemindState() {
		(interactor as? NewTaskOverlayInteractor)?.didToggleRemindSwitcher()
	}
}
