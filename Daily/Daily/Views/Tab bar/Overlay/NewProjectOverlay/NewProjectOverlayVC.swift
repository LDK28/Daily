//
//  NewProjectOverlayVC.swift
//  Daily
//
//  Created by Арсений Токарев on 17.11.2020.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

class NewProjectOverlayVC: OverlayVC {
	var router: (NewProjectOverlayRoutingLogic & NewProjectOverlayDataPassing)?
  
	override func loadView() {
		super.loadView()
		styleUI()
	}
	
	override func styleUI() {
		super.styleUI()
		titleLabel.styleOverlayLabel(text: "Create new project")
	}

}

extension NewProjectOverlayVC: DailyOptionalDateCellDelegate {
	func didToggleDateSwitcher() {
		(interactor as? NewProjectOverlayInteractor)?.didToggleDateSwitcher()
	}
}

extension NewProjectOverlayVC: DailyTeamProjectCellDelegate {
	func didToggleTeamProjectState() {
		(interactor as? NewProjectOverlayInteractor)?.didToggleTeamProjectSwitcher()
	}
}
